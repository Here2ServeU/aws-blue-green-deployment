variable "blue_bucket_name" {
  description = "Name of the Blue S3 bucket"
  type        = string
}

variable "green_bucket_name" {
  description = "Name of the Green S3 bucket"
  type        = string
}

variable "blue_index_file" {
  description = "Path to the Blue index file"
  type        = string
}

variable "green_index_file" {
  description = "Path to the Green index file"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, stage, prod)"
  type        = string
}
