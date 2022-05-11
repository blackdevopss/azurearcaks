// ROUTE TABLES
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks.id


  tags = {
    Name = "rtb-eks-public-us-west-1"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "rtb-eks-private-us-west-1"
  }
}

// ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_east_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_east_1b.id
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
  nat_gateway_id         = aws_nat_gateway.private_1a.id

}
