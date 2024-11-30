module "s3_buckets" {
  source             = "../../modules/s3-buckets"
  blue_bucket_name   = "t2s-dev-blue-bucket"
  green_bucket_name  = "t2s-dev-green-bucket"
  blue_index_file    = "${path.module}/files/index-blue.html"
  green_index_file   = "${path.module}/files/index-green.html"
  environment        = "dev"
}

module "route53" {
  source                  = "../../modules/route53"
  domain_name             = var.domain_name # Replace with your domain name
  record_name             = var.record_name # Replace with your record name
  blue_bucket_url         = module.s3_buckets.blue_bucket_url
  green_bucket_url        = module.s3_buckets.green_bucket_url
  blue_cloudfront_url     = module.cloudfront.blue_domain_name
  green_cloudfront_url    = module.cloudfront.green_domain_name
  active_environment      = var.active_environment
  cloudfront_hosted_zone_id = "Z2FDTNDATAQYW2" # Default hosted zone ID for CloudFront
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  blue_distribution_id  = "E19TXOBXEAB3RX" # Replace with actual ID
  green_distribution_id = "E18XO592ZPE2MQ" # Replace with actual ID
}
