variable "aws_region" { type = string }

variable "ip_white_list" { type = string }

variable "ssh_public_key" { type = string }

variable "access_key" { type = string }

variable "secret_key" { type = string }

variable "region" { type = string }

variable "eks_cluster_name" { type = string }


variable "eks_public_subnets_cidr" {
  type = list(string)
}

variable "eks_private_subnets_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "eks_vpc_cidr" {
  type = string
}

variable "instance_tenancy" {
  type = string
}