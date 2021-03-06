terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.13.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Environment = "POC"
    }
  }
}


terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "aws-eks-network"
    }
  }
}