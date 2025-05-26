provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "mybucketpmr123" {
  bucket = "pmrmay-2025"
}