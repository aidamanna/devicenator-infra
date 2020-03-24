provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "devicenator_ui" {
  bucket = "devicenator.com"
  acl    = "public-read"
  policy = "${file("bucket-policy.json")}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
