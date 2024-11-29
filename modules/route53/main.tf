# Create a Hosted Zone
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# Create a DNS Record
resource "aws_route53_record" "active_record" {
  zone_id = aws_route53_zone.main.id
  name    = var.record_name
  type    = "CNAME"

  records = [var.active_environment == "blue" ? var.blue_bucket_url : var.green_bucket_url]
  ttl     = 300
}
