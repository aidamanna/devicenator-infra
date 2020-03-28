provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "devicenator-terraform-state"
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name = "devicentator-terraform-state-locks"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
