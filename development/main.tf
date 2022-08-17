variable "cidr_block" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-daniel-tutorial-jenkins"
    key     = "./backend-state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

resource "aws_vpc" "main_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    name = "jenkins-instance-main_vpc"
  }
}
