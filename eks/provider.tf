terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.2.2"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }
  }
}

provider "aws" {

  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key

}


terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "azurearc-eks"
    }
  }
}