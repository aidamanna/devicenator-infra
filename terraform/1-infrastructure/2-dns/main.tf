provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_route53_zone" "devicenator" {
  name = "devicenator.com"
}
