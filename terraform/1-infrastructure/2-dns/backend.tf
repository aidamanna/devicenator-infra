terraform {
  backend "s3" {
    encrypt = true
    bucket = "devicenator-terraform-state-bucket"
    region = "eu-west-1"
    key = "dns-terraform.tfstate"
    dynamodb_table = "devicentator-terraform-state-lock"
  }
}
