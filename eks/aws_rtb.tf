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
  subnet_id      = [element(aws_subnet.public.*.id, count.index)]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = [element(aws_subnet.private.*.id, count.index)]
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
