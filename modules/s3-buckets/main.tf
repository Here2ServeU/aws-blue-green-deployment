resource "aws_s3_bucket" "blue_bucket" {
  bucket = var.blue_bucket_name

  tags = {
    Environment = var.environment
    Type        = "Blue"
  }
}

resource "aws_s3_bucket_website_configuration" "blue_bucket_website" {
  bucket = aws_s3_bucket.blue_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "blue_index" {
  bucket       = aws_s3_bucket.blue_bucket.id
  key          = "index.html"
  content      = file(var.blue_index_file)
  content_type = "text/html"
}

resource "aws_s3_bucket" "green_bucket" {
  bucket = var.green_bucket_name

  tags = {
    Environment = var.environment
    Type        = "Green"
  }
}

resource "aws_s3_bucket_website_configuration" "green_bucket_website" {
  bucket = aws_s3_bucket.green_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "green_index" {
  bucket       = aws_s3_bucket.green_bucket.id
  key          = "index.html"
  content      = file(var.green_index_file)
  content_type = "text/html"
}
