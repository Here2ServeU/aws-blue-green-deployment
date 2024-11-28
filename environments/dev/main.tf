module "s3_bucket" {
  source        = "../../modules/s3-buckets"
  bucket_name   = var.bucket_name
  environment   = var.environment
  index_file    = "${path.module}/../files/index-blue.html"
}

module "route53" {
  source                  = "../../modules/route53"
  zone_id                 = var.zone_id
  record_name             = var.record_name
  cloudfront_domain_name  = var.cloudfront_domain_name
  cloudfront_hosted_zone_id = var.cloudfront_hosted_zone_id
}
