variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "active_environment" {
  description = "Specify active environment (blue or green)"
  type        = string
}

variable "index_file" {
  description = "Path to the index file"
  type        = string
}

variable "zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}

variable "record_name" {
  description = "DNS record name"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "Hosted Zone ID for CloudFront"
  type        = string
}
