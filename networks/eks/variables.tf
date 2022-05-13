variable "private_subnets" {
  type = map(object({
    cidr_block                          = string
    availability_zone                   = string
    private_dns_hostname_type_on_launch = string
    map_public_ip_on_launch             = bool
    tags = object({
      Name = string
      Type = string
    })

  }))
}

variable "public_subnets" {
  type = map(object({
    cidr_block                          = string
    availability_zone                   = string
    private_dns_hostname_type_on_launch = string
    map_public_ip_on_launch             = bool
    tags = object({
      Name = string
      Type = string
    })

  }))
}

variable "vpc" {
  type = map(object({
    cidr_block           = string
    instance_tenancy     = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    tags = object({
      Name = string
    })
  }))
}

variable "internet_gateways" {
  type = map(object({
    tags = object({
      Name = string
    })
  }))
}

variable "public_route_tables" {
  type = map(object({
    route = object({
      cidr_block = string
    })
    tags = object({
      Name = string
    })
  }))
}

variable "private_route_tables" {
  type = map(object({
    route = object({
      cidr_block = string
    })
    tags = object({
      Name = string
    })
  }))
}

variable "nat_gateways" {
  type = map(object({
    tags = object({
      Name = string
    })
  }))
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    ingress = object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
    egress = object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
    tags = object({
      Name = string
    })
  }))
}

variable "vpc_gateway_endpoints" {
  type = map(object({
    service_name      = string
    vpc_endpoint_type = string
    auto_accept       = bool

  }))
}

variable "vpc_interface_endpoints" {
  type = map(object({
    service_name        = string
    vpc_endpoint_type   = string
    auto_accept         = bool
    private_dns_enabled = bool

  }))
}

variable "aws_region" { type = string }
variable "access_key" { type = string }
variable "secret_key" { type = string }

