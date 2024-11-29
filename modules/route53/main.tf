# Create a Hosted Zone
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# Create a DNS A Record
resource "aws_route53_record" "active_record" {
  zone_id = aws_route53_zone.main.id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.active_environment == "blue" ? var.blue_bucket_url : var.green_bucket_url
    zone_id                = var.cloudfront_hosted_zone_id  # Replace with CloudFront hosted zone ID
    evaluate_target_health = false
  }
}
