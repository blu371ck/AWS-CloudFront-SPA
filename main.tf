provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.subdomain}.${var.domain_name}"
}

data "aws_route53_zone" "primary" {
  name = var.domain_name
}

module "s3_static_website" {
  source      = "./modules/s3"
  bucket_name = "andrew-mckenzie-static-site-bucket"
  website_source_path = var.website_source_path
  oai_iam_arn   = aws_cloudfront_origin_access_identity.oai.iam_arn
}

module "acm_certificate" {
  source      = "./modules/acm"
  domain_name = var.domain_name
  subdomain   = var.subdomain
  zone_id     = data.aws_route53_zone.primary.zone_id
  providers = {
    aws = aws.us-east-1
  }
}

module "cloudfront_distribution" {
  source               = "./modules/cloudfront"
  bucket_regional_domain_name = module.s3_static_website.bucket_regional_domain_name
  bucket_id            = module.s3_static_website.bucket_id
  acm_certificate_arn  = module.acm_certificate.certificate_arn
  subdomain            = var.subdomain
  domain_name          = var.domain_name
  oai_path             = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
  website_content_version = module.s3_static_website.website_content_version
}

module "route53_record" {
  source          = "./modules/route53"
  zone_id         = data.aws_route53_zone.primary.zone_id
  subdomain       = var.subdomain
  cloudfront_domain_name = module.cloudfront_distribution.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront_distribution.cloudfront_hosted_zone_id
}