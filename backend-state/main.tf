variable "aws_region" {
  default = "us-east-1"
}
variable "aws_secret_key" {}
variable "aws_access_key" {}


provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-daniel-tutorial-jenkins"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
