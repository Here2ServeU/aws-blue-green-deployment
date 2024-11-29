output "blue_bucket_url" {
  value = aws_s3_bucket_website_configuration.blue_bucket_website.website_endpoint
}

output "green_bucket_url" {
  value = aws_s3_bucket_website_configuration.green_bucket_website.website_endpoint
}
