provider "aws" {
  region     = "us-east-1"
}

resource "aws_vpc" "assignment_vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "assignment-VPC"
  }
}

resource "aws_subnet" "public_us_east_1a" {
  vpc_id     = aws_vpc.assignment_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet-us-east-1a"
  }
}

resource "aws_subnet" "public_us_east_1b" {
  vpc_id     = aws_vpc.assignment_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-subnet-us-east-1b"
  }
}

resource "aws_internet_gateway" "assignment_vpc_igw" {
  vpc_id = aws_vpc.assignment_vpc.id

  tags = {
    Name = "assignment-VPC-IGW"
  }
}

resource "aws_route_table" "assignment_vpc_public" {
    vpc_id = aws_vpc.assignment_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.assignment_vpc_igw.id
    }

    tags = {
        Name = "public-subnet-rtb"
    }
}

resource "aws_route_table_association" "assignment_vpc_us_east_1a_public" {
    subnet_id = aws_subnet.public_us_east_1a.id
    route_table_id = aws_route_table.assignment_vpc_public.id
}

resource "aws_route_table_association" "assignment_vpc_us_east_1b_public" {
    subnet_id = aws_subnet.public_us_east_1b.id
    route_table_id = aws_route_table.assignment_vpc_public.id
}
