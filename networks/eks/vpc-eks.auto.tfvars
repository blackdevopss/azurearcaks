// VPC
vpc = {

  "eks" = {
    cidr_block           = "100.64.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags = {
      Env    = "poc"
      Name   = "eks-vpc-us-west-1"
      Region = "us-west-1"
    }
  }
}

// SUBNETS
private_subnets = {

  "az-1" = {
    availability_zone                   = "us-west-1b"
    cidr_block                          = "100.64.0.0/20"
    map_public_ip_on_launch             = false
    private_dns_hostname_type_on_launch = "resource-name"

    tags = {
      Name = "eks-snet-private-us-west-1b"
      Type = "Private"
    }
  }

  "az-2" = {
    availability_zone                   = "us-west-1c"
    cidr_block                          = "100.64.16.0/20"
    map_public_ip_on_launch             = false
    private_dns_hostname_type_on_launch = "resource-name"

    tags = {
      Name = "eks-snet-private-us-west-1c"
      Type = "Private"
    }
  }
}

public_subnets = {

  "az-1" = {
    availability_zone                   = "us-west-1b"
    cidr_block                          = "100.64.32.0/20"
    map_public_ip_on_launch             = true
    private_dns_hostname_type_on_launch = "resource-name"

    tags = {
      Name = "eks-snet-public-us-west-1b"
      Type = "Private"
    }
  }

  "az-2" = {
    availability_zone                   = "us-west-1c"
    cidr_block                          = "100.64.48.0/20"
    map_public_ip_on_launch             = true
    private_dns_hostname_type_on_launch = "resource-name"

    tags = {
      Name = "eks-snet-public-us-west-1c"
      Type = "Private"
    }
  }
}

// VPC ENDPOINTS
vpc_gateway_endpoints = {

  "s3" = {
    auto_accept       = true
    service_name      = "com.amazonaws.us-west-1.s3"
    vpc_endpoint_type = "Gateway"
  }
  "dynamo" = {
    auto_accept       = true
    service_name      = "com.amazonaws.us-west-1.dynamodb"
    vpc_endpoint_type = "Gateway"
  }
}

vpc_interface_endpoints = {

  "rds" = {
    auto_accept         = true
    service_name        = "com.amazonaws.us-west-1.rds"
    vpc_endpoint_type   = "Interface"
    private_dns_enabled = true
  }
}

// GATEWAYS
internet_gateways = {

  "eks" = {
    tags = {
      Name = "eks-vpc-igw"
    }
  }
}

nat_gateways = {

  "az-1" = {

    tags = {
      Name = "eks-vpc-ngw-us-west-1b"
    }
  }
}

// ROUTE TABLES
public_route_tables = {

  "public" = {

    route = {
      cidr_block = "0.0.0.0/0"
    }

    tags = {
      Name = "eks-route-table-public"
    }
  }
}

private_route_tables = {

  "private" = {

    route = {
      cidr_block = "0.0.0.0/0"
    }

    tags = {
      Name = "eks-route-table-private"
    }
  }
}
