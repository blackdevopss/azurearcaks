/*
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
*/