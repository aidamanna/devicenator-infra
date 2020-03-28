provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "devicenator_ui" {
  bucket = "devicenator.com"
  acl    = "public-read"
  policy = file("website-access-policy.json")

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_iam_user" "travis" {
  name = "travis"
}

resource "aws_iam_access_key" "travis" {
  user = aws_iam_user.travis.name
}

resource "aws_iam_user_policy" "travis_user_policy" {
  name = "deploy-website"
  user = aws_iam_user.travis.name
  policy = file("deploy-website-policy.json")
}
