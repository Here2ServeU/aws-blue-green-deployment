variable "blue_bucket_url" {
  description = "Website endpoint for the Blue bucket"
  type        = string
}

variable "green_bucket_url" {
  description = "Website endpoint for the Green bucket"
  type        = string
}

variable "active_environment" {
  description = "Specify active environment (blue or green)"
  type        = string
}

variable "zone_id" {
  description = "Route 53 hosted zone ID"
  type        = string
}

variable "record_name" {
  description = "DNS record name"
  type        = string
}
