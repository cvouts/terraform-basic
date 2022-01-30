resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_website.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.my_website.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.myOAI.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.my_website.id

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_identity" "myOAI" {
}