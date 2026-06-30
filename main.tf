provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "portfolio" {
  bucket = "tahir-ibrahim-portfolio-2026"
}

resource "aws_s3_bucket_public_access_block" "portfolio_public" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "portfolio_config" {
  bucket = aws_s3_bucket.portfolio.id

  index_document {
    suffix = "index.html"
  }
}