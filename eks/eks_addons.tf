resource "aws_eks_addon" "vpc_cni" {
  count        = 1
  cluster_name = element(aws_subnet.public.*.name, 0)
  addon_name   = "vpc-cni"

  depends_on = [aws_eks_cluster.eks]
}