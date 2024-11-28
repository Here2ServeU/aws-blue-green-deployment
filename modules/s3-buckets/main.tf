resource "aws_s3_bucket" "blue_green_bucket" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_s3_bucket_object" "blue_version" {
  bucket       = aws_s3_bucket.blue_green_bucket.id
  key          = "index.html"
  content      = file(var.index_file)
  content_type = "text/html"
}
