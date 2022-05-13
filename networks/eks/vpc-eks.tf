resource "aws_vpc" "vpc" {
  for_each             = var.vpc
  cidr_block           = each.value.cidr_block
  instance_tenancy     = each.value.instance_tenancy
  enable_dns_hostnames = each.value.enable_dns_hostnames
  enable_dns_support   = each.value.enable_dns_support

  tags = {
    Name = each.value.tags.Name
  }
}

resource "aws_subnet" "private_subnet" {
  for_each                            = var.private_subnets
  vpc_id                              = aws_vpc.vpc["eks"].id
  cidr_block                          = each.value.cidr_block
  availability_zone                   = each.value.availability_zone
  private_dns_hostname_type_on_launch = each.value.private_dns_hostname_type_on_launch
  map_public_ip_on_launch             = each.value.map_public_ip_on_launch

  tags = {
    Name = each.value.tags.Name
    Type = each.value.tags.Type

  }
}

resource "aws_subnet" "public_subnet" {
  for_each                            = var.public_subnets
  vpc_id                              = aws_vpc.vpc["eks"].id
  cidr_block                          = each.value.cidr_block
  availability_zone                   = each.value.availability_zone
  private_dns_hostname_type_on_launch = each.value.private_dns_hostname_type_on_launch
  map_public_ip_on_launch             = each.value.map_public_ip_on_launch

  tags = {
    Name = each.value.tags.Name
    Type = each.value.tags.Type

  }
}

resource "aws_internet_gateway" "igw" {
  for_each = var.internet_gateways
  vpc_id   = aws_vpc.vpc["eks"].id

  tags = {
    Name = each.value.tags.Name
  }
}

resource "aws_nat_gateway" "ngw_usw_1c" {
  for_each          = var.nat_gateways
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet[each.key].id

  tags = {
    "Name" = each.value.tags.Name
  }
}
