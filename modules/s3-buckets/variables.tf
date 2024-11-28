variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
}

variable "index_file" {
  description = "Path to the index file to upload to the bucket"
  type        = string
}
