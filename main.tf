/*
#Create a S3 bucket with random Id apppended to bucket name
resource "aws_s3_bucket" "mybucket" {
  bucket = format("%s-%s", var.bucketname,random_id.random_hex.hex)

  tags = {
    Name        = "My bucket"
  }
}

#Create random id
resource "random_id" "random_hex" {
  byte_length = 8
}

#S3 bucket ownership control
resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#To make the s3 bucket public:
resource "aws_s3_bucket_public_access_block" "s3_bucket_publicaccess" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
# S3 bucket Access control list - (ACL)
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_ownership,
    aws_s3_bucket_public_access_block.s3_bucket_publicaccess,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}
*/

#Module for vpc 
module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_new  = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
