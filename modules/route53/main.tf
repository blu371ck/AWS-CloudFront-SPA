resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}