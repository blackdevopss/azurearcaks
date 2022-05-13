resource "aws_security_group" "sg" {
  for_each    = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.vpc["eks"].id

  ingress {
    description = each.value.ingress.description
    from_port   = each.value.ingress.from_port
    to_port     = each.value.ingress.to_port
    protocol    = each.value.ingress.protocol
    cidr_blocks = each.value.ingress.cidr_blocks
  }

  egress {
    description = each.value.egress.description
    from_port   = each.value.egress.from_port
    to_port     = each.value.egress.to_port
    protocol    = each.value.egress.protocol
    cidr_blocks = each.value.egress.cidr_blocks
  }

  tags = {
    Name = each.value.tags.Name
  }
}


