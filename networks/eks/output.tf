output "vpc_ids" {
  value = {
    for id in keys(var.vpc) : id => aws_vpc.vpc[id].id
  }
}

output "subnet_ids" {
  value = {
    for id in keys(var.private_subnets) : id => aws_subnet.private_subnet[id].id
  }
}

output "public_route_table_id" {
  value = {
    for id in keys(var.public_route_tables) : id => aws_route_table.public[id].id
  }
}

output "private_route_table_id" {
  value = {
    for id in keys(var.private_route_tables) : id => aws_route_table.private[id].id
  }
}

output "internet_gateway_id" {
  value = {
    for id in keys(var.internet_gateways) : id => aws_internet_gateway.igw[id].id
  }
}

output "nat_gateway_id" {
  value = {
    for id in keys(var.nat_gateways) : id => aws_nat_gateway.ngw_usw_1c[id].id
  }
}

output "security_group_ids" {
  value = {
    for id in keys(var.security_groups) : id => aws_security_group.sg[id].id
  }
}