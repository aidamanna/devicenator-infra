provider "aws" {
  profile = "default"
  region = local.region
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "devicenator-state-bucket"
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name = "devicentator-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
