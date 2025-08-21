variable "domain_name" {
  description = "The domain name."
  type        = string
}

variable "subdomain" {
  description = "The subdomain."
  type        = string
}

variable "zone_id" {
  description = "The Route 53 hosted zone ID."
  type        = string
}