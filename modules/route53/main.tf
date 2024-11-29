resource "aws_route53_record" "active_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.active_environment == "blue" ? var.blue_bucket_url : var.green_bucket_url
    zone_id                = var.zone_id
    evaluate_target_health = false
  }
}
