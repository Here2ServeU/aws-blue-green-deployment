output "blue_bucket_url" {
  value = aws_s3_bucket.blue_bucket.website_endpoint
}

output "green_bucket_url" {
  value = aws_s3_bucket.green_bucket.website_endpoint
}
