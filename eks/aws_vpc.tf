// VPC
resource "aws_vpc" "eks" {
  cidr_block           = var.eks_vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "vpc-${local.prefix}-${local.Env}-${local.region_prefix}"
    Environment = "${local.Env}"
  }
}

// PUBLIC SUBNETS
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.eks.id
  count                   = length(var.eks_public_subnets_cidr)
  cidr_block              = element(var.eks_public_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "snet-${local.prefix}-${local.Env}-${element(var.availability_zones, count.index)}-pub"
    Env  = "${local.Env}"
  }
}

// PRIVATE SUBNETS
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.eks.id
  count                   = length(var.eks_private_subnets_cidr)
  cidr_block              = element(var.eks_private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "snet-${local.prefix}-${local.Env}-${element(var.availability_zones, count.index)}-priv"
    Env  = "${local.Env}"
    type = "Private"
  }
}

// NAT GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "igw-${local.prefix}-${local.Env}-${local.region_prefix}"
    Env  = "${local.Env}"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

// NAT GATEWAY
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "ngw-${local.prefix}-${local.Env}-${local.region_prefix}"
    Env  = "${local.Env}"
  }
}