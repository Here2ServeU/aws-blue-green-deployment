module "s3_buckets" {
  source             = "../../modules/s3-buckets"
  blue_bucket_name   = "t2s-dev-blue-bucket"
  green_bucket_name  = "t2s-dev-green-bucket"
  blue_index_file    = "${path.module}/../files/index-blue.html"
  green_index_file   = "${path.module}/../files/index-green.html"
  environment        = "dev"
}

module "route53" {
  source                  = "../../modules/route53"
  zone_id                 = var.zone_id
  record_name             = var.record_name
  cloudfront_domain_name  = var.cloudfront_domain_name
  cloudfront_hosted_zone_id = var.cloudfront_hosted_zone_id
}
