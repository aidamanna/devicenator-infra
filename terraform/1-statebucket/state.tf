terraform {
  backend "s3" {
    encrypt = true
    bucket = "devicenator-terraform-state"
    region = "eu-west-1"
    key = "terraform.tfstate"
    dynamodb_table = "devicentator-terraform-state-locks"
  }
}