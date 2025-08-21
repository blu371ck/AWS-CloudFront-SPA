output "website_url" {
  description = "The URL of the deployed website."
  value       = "https://${var.subdomain}.${var.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution."
  value       = module.cloudfront_distribution.cloudfront_id
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket storing the website files."
  value       = module.s3_static_website.bucket_id
}
