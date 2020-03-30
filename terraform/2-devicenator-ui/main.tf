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

data "aws_route53_zone" "devicenator" {
  name = "devicenator.com"
}

resource "aws_route53_record" "devicenator" {
  zone_id = data.aws_route53_zone.devicenator.zone_id
  name    = "devicenator.com"
  type    = "A"

  alias {
    name    = aws_s3_bucket.devicenator_ui.website_domain
    zone_id = aws_s3_bucket.devicenator_ui.hosted_zone_id
    evaluate_target_health = false
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
