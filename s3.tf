resource "aws_s3_bucket" "my_website" {
  bucket = "cvouts-s3-website-test"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "website_index" {
  bucket = aws_s3_bucket.my_website.bucket
  acl    = "public-read"
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"

  etag = filemd5("index.html")
}

resource "aws_s3_bucket_object" "website_css" {
  bucket = aws_s3_bucket.my_website.bucket
  acl    = "public-read"
  key    = "style.css"
  source = "style.css"
  content_type = "text/css"

  etag = filemd5("style.css")
}

resource "aws_s3_bucket_object" "website_logo" {
  bucket = aws_s3_bucket.my_website.bucket
  acl    = "public-read"
  key    = "logo.png"
  source = "logo.png"
  content_type = "image/x-icon"

  etag = filemd5("logo.png")
}
