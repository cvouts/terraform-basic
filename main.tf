terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "cvouts-s3-website-test"
  acl    = "public-read"
  //policy = file("policy.json")

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.bucket
  acl    = "public-read"
  key    = "index"
  source = "index.html"
  content_type = "text/html"

  etag = filemd5("index.html")
}


