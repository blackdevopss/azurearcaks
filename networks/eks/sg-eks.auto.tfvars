security_groups = {

  "cluster" = {

    description = "SG used by EKS Cluster"

    ingress = {
      cidr_blocks = ["100.64.0.0/16"]
      description = "value"
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      description = "Internal Ingress"
    }

    egress = {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      description = "Internet Egress"
    }

    name = "EKS-ClusterSecurityGroup"

    tags = {
      Name = "EKS-ClusterSecurityGroup"
    }
  }

  "nodegroup" = {

    description = "SG Used by EKS Node Groups"

    ingress = {
      cidr_blocks = ["100.64.0.0/16"]
      description = "value"
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      description = "Internal Ingress"
    }

    egress = {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      description = "Internet Egress"
    }

    name = "EKS-NodeGroupSecurityGroup"

    tags = {
      Name = "EKS-NodeGroupSecurityGroup"
    }
  }
}
