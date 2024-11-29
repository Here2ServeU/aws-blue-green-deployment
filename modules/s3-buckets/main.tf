# Blue bucket
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

# Green bucket
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
