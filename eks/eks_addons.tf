resource "aws_eks_addon" "vpc_cni" {
  count        = 1
  cluster_name = "${local.prefix}-${local.Env}-${local.region_prefix}"
  addon_name   = "vpc-cni"

  depends_on = [aws_eks_cluster.eks]
}