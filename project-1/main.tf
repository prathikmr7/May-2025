provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

#creating the VPC. 
resource "aws_vpc" "myvpc" {
 cidr_block = "10.0.0.0/16"
 enable_dns_hostnames = true
 enable_dns_support = true  
}

#creating the first subnet(public subnet)

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet 1"
  }
}

#creating the second subnet(private subnet)
resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet 2"
  }
}

#Creating Internet Gateway

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

}

#Create Route Table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id
}

#Creating a route for Public subnet

resource "aws_route" "public_route" {
 route_table_id = aws_route_table.public_route_table.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.myigw.id
}

#Associate public route

resource "aws_route_table_association" "public_subnet_association" {
 subnet_id =  aws_subnet.subnet_1.id
 route_table_id = aws_route_table.public_route_table.id

}