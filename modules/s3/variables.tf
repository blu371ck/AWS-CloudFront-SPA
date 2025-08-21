variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "website_source_path" {
  description = "The local path to the website files."
  type        = string
}

variable "oai_iam_arn" {
  description = "The IAM ARN of the CloudFront Origin Access Identity"
  type        = string
}

variable "mime_types" {
  description = "A map of file extensions to MIME types."
  type        = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".ico"  = "image/x-icon"
    ".svg"  = "image/svg+xml"
    ".png"  = "images/png"
  }
}