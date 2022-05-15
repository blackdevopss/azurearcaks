output "vpc_ids" {
  value = {
    for id in keys(var.vpcs) : id => google_compute_network.vpc[id].id
  }
}

output "vpc_prov_subnet_ids" {
  value = {
    for id in keys(var.provider_vpc_subnets) : id => google_compute_subnetwork.provider_subnet[id].id
  }
}

output "vpc_cons_subnet_ids" {
  value = {
    for id in keys(var.consumer_vpc_subnets) : id => google_compute_subnetwork.consumer_subnet[id].id
  }
}

