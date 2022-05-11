data "aws_subnets" "private" {
  filter {
    name   = "tag:Type"
    values = ["Private"]
  }

  depends_on = [aws_subnet.private, aws_subnet.public, aws_vpc.eks]
}

output "private_subnet_ids" {
  value = data.aws_subnets.private.ids
}