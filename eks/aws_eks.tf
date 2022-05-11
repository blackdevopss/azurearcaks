resource "aws_eks_cluster" "eks" {
  count    = 1
  name     = "${local.prefix}-${local.Env}-${local.region_prefix}"
  role_arn = aws_iam_role.eks.arn
  version  = var.eks_version



  vpc_config {
    subnet_ids              = [data.aws_subnets.private.ids]
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = [aws_security_group.eks.id]
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.service_ipv4_cidr
    ip_family         = var.eks_ip_family
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKSVPCResourceController,
  ]
}

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