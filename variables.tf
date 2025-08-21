variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The registered domain name in Route 53 (e.g., example.com)."
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the website (e.g., www, app)."
  type        = string
}

variable "website_source_path" {
  description = "The local path to the Webpack build directory."
  type        = string
}

variable "s3_bucket_name" {
  description = "Optional: A specific name for the S3 bucket. If not provided, a random name will be generated."
  type        = string
  default     = ""
}
