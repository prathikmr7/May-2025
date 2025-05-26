provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
   Name ="test-vpc"
  }
}