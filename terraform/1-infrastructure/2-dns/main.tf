provider "aws" {
  profile = "default"
  region = var.region
}

data "aws_s3_bucket" "devicenator_ui" {
  bucket = "devicenator.com"
}

resource "aws_route53_zone" "devicenator" {
  name = "devicenator.com"
}

resource "aws_route53_record" "devicenator" {
  zone_id = aws_route53_zone.devicenator.zone_id
  name    = "devicenator.com"
  type    = "A"

  alias {
    name    = data.aws_s3_bucket.devicenator_ui.website_domain
    zone_id = data.aws_s3_bucket.devicenator_ui.hosted_zone_id
    evaluate_target_health = false
  }
}