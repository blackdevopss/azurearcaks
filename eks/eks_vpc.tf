data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name                 = "vpc-${local.prefix}-${local.Env}-${local.region_prefix}"
  cidr                 = var.eks_vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.eks_private_subnets_cidr
  public_subnets       = var.eks_public_subnets_cidr
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.prefix}-${local.Env}-${local.region_prefix}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.prefix}-${local.Env}-${local.region_prefix}" = "shared"
    "kubernetes.io/role/elb"                                                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.prefix}-${local.Env}-${local.region_prefix}" = "shared"
    "kubernetes.io/role/internal-elb"                                           = "1"
  }
}

