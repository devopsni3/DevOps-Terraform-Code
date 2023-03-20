# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc1" {
  cidr_block = "192.168.0.0/16"
   tags = {
    Name = "pes36-vpc"
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "pes36-igw-1"
  }
}

resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.pub_sub_cidr

  tags = {
    Name = var.project
  }
}

resource "aws_subnet" "priv_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.priv_sub_cidr

  tags = {
    Name = var.project
  }
}
  
resource "aws_route_table" "pub_rt" {
    vpc_id  =   aws_vpc.vpc1.id

}

resource "aws_route_table" "priv_rt" {
    vpc_id  =   aws_vpc.vpc1.id

}