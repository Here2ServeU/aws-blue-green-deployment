# Blue Bucket
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

resource "aws_s3_bucket_policy" "blue_bucket_policy" {
  bucket = aws_s3_bucket.blue_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.blue_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "blue_index" {
  bucket       = aws_s3_bucket.blue_bucket.id
  key          = "index.html"
  content      = file(var.blue_index_file)
  content_type = "text/html"
}

# Green Bucket
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

resource "aws_s3_bucket_policy" "green_bucket_policy" {
  bucket = aws_s3_bucket.green_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.green_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "green_index" {
  bucket       = aws_s3_bucket.green_bucket.id
  key          = "index.html"
  content      = file(var.green_index_file)
  content_type = "text/html"
}

# Disable Block Public Access for Blue Bucket
resource "aws_s3_bucket_public_access_block" "blue_bucket_block" {
  bucket = aws_s3_bucket.blue_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Disable Block Public Access for Green Bucket
resource "aws_s3_bucket_public_access_block" "green_bucket_block" {
  bucket = aws_s3_bucket.green_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
