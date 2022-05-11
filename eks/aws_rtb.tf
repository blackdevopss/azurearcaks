// ROUTE TABLES
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks.id


  tags = {
    Name = "rtb-${local.prefix}-${local.Env}-pub-${local.region_prefix}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "rtb-${local.prefix}-${local.Env}-priv-${local.region_prefix}"
  }
}

// ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "public" {
  count          = length(var.eks_private_subnets_cidr)
  subnet_id      = element(aws_subnet.public[count.index].id)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(data.aws_subnets.private.ids)
  subnet_id      = data.aws_subnets.private.ids[count.index]
  route_table_id = aws_route_table.private.id
}


// ROUTES
resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private_egress" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id

}
