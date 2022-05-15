output "subnet_ids" {
  value = {
    for id in keys(var.vnet_subnets) : id => azurerm_subnet.aks[id].id
  }
}

