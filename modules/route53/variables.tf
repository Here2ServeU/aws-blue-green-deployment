variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "record_name" {
  description = "Record name for DNS"
  type        = string
}

variable "blue_bucket_url" {
  description = "URL of the Blue bucket"
  type        = string
}

variable "green_bucket_url" {
  description = "URL of the Green bucket"
  type        = string
}

variable "active_environment" {
  description = "Active environment (blue or green)"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "Hosted Zone ID for CloudFront"
  type        = string
}
