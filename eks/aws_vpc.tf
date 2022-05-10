// VPC
resource "aws_vpc" "eks" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-eks-us-east-1"
  }
}

// SUBNETS
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.eks.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "snet-eks-public-us-east-1a"
  }
}

resource "aws_subnet" "private_east_1a" {
  vpc_id     = aws_vpc.eks.id
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "snet-eks-private-us-east-1a"
  }
}

resource "aws_subnet" "private_east_1b" {
  vpc_id     = aws_vpc.eks.id
  cidr_block = "10.0.32.0/20"

  tags = {
    Name = "snet-eks-private-us-east-1b"
  }
}

// INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "igw-eks-vpc-us-east-1"
  }
}

// NAT GATEWAY
resource "aws_nat_gateway" "private_1a" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_east_1a.id

  tags = {
    "Name" = "ngw-eks-private-us-east-1a"
  }
}

// NAT GATEWAY
resource "aws_nat_gateway" "private_1b" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_east_1b.id

  tags = {
    "Name" = "ngw-eks-private-us-east-1b"
  }
}