
resource "aws_route_table" "public" {
  for_each = var.public_route_tables
  vpc_id   = aws_vpc.vpc["eks"].id

  route {
    cidr_block = each.value.route.cidr_block
    gateway_id = aws_internet_gateway.igw["eks"].id
  }

  tags = {
    Name = each.value.tags.Name
  }
}

resource "aws_route_table" "private" {
  for_each = var.private_route_tables
  vpc_id   = aws_vpc.vpc["eks"].id

  route {
    cidr_block     = each.value.route.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw_usw_1c["az-1"].id
  }

  tags = {
    Name = each.value.tags.Name
  }
}

resource "aws_route_table_association" "private_az1" {
  for_each       = var.private_subnets
  subnet_id      = aws_subnet.private_subnet["az-1"].id
  route_table_id = aws_route_table.private["private"].id
}

resource "aws_route_table_association" "private_az2" {
  for_each       = var.private_subnets
  subnet_id      = aws_subnet.private_subnet["az-2"].id
  route_table_id = aws_route_table.private["private"].id
}

resource "aws_route_table_association" "public_az1" {
  for_each       = var.public_subnets
  subnet_id      = aws_subnet.public_subnet["az-1"].id
  route_table_id = aws_route_table.public["public"].id
}

resource "aws_route_table_association" "public_az2" {
  for_each       = var.public_subnets
  subnet_id      = aws_subnet.public_subnet["az-2"].id
  route_table_id = aws_route_table.public["public"].id
}