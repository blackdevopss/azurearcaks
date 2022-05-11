output "vpc_id" { value = aws_vpc.eks.id }

output "endpoint" {
  value = aws_eks_cluster.eks[*].endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks[*].certificate_authority[*].data

  sensitive = true
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.private[*].id
}