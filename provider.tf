terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0"
    }
  }
  backend "s3" {
    bucket = "terraform-practice-tfstate-s3backup"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
   region = "us-east-2"
}