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