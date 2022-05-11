resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks[count.index]
  addon_name   = "vpc-cni"
}