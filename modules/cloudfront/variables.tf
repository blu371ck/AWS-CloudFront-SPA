variable "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket."
  type        = string
}

variable "bucket_id" {
  description = "The ID of the S3 bucket."
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate."
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the website."
  type        = string
}

variable "domain_name" {
  description = "The domain name."
  type        = string
}

variable "oai_path" {
  description   = "The path for the CloudFront Origin Access Identity."
  type          = string
}

variable "website_content_version" {
  description = "A unique identifier for the current version of the website content, used to trigger cache invalidation."
  type        = string
}