resource "aws_eks_addon" "vpc_cni" {
  count        = 1
  cluster_name = element(aws_vpc.eks.*.id, 0)
  addon_name   = "vpc-cni"
}