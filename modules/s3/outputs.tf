output "bucket_id" {
  value = aws_s3_bucket.website.id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.website.bucket_regional_domain_name
}

output "website_content_version" {
  description = "A unique identifier for the current version of the website content."
  value       = sha1(jsonencode([for obj in aws_s3_object.website_files : obj.etag]))
}