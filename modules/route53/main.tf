resource "aws_route53_record" "active_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.active_environment == "blue" ? aws_s3_bucket.blue_bucket.website_endpoint : aws_s3_bucket.green_bucket.website_endpoint
    zone_id                = var.route53_zone_id
    evaluate_target_health = false
  }
}
