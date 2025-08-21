variable "zone_id" {
  description = "The ID of the hosted zone."
  type        = string
}

variable "subdomain" {
  description = "The subdomain to create the record for."
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution."
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution."
  type        = string
}