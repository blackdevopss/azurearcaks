resource "aws_vpc_endpoint" "gateway" {
  for_each          = var.vpc_gateway_endpoints
  vpc_id            = aws_vpc.vpc["eks"].id
  service_name      = each.value.service_name
  vpc_endpoint_type = each.value.vpc_endpoint_type
  auto_accept       = each.value.auto_accept
  route_table_ids = [aws_route_table.private["private"].id,
  aws_route_table.private["private"].id]

}

resource "aws_vpc_endpoint" "interface" {
  for_each          = var.vpc_interface_endpoints
  vpc_id            = aws_vpc.vpc["eks"].id
  service_name      = each.value.service_name
  vpc_endpoint_type = each.value.vpc_endpoint_type
  auto_accept       = each.value.auto_accept

  subnet_ids = [
    aws_subnet.private_subnet["az-1"].id,
    aws_subnet.private_subnet["az-2"].id
  ]

  security_group_ids = [
    aws_security_group.sg["cluster"].id,
    aws_security_group.sg["nodegroup"].id
  ]
  private_dns_enabled = each.value.private_dns_enabled

}

