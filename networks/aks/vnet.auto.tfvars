azure_region       = "centralus"
vnet_name          = "vnet-arc-aks-poc"
vnet_address_space = ["10.150.0.0/19"]

service_endpoints = [
  "Microsoft.Storage",
  "Microsoft.Sql",
  "Microsoft.ContainerRegistry",
  "Microsoft.AzureCosmosDB",
  "Microsoft.KeyVault",
  "Microsoft.ServiceBus",
  "Microsoft.EventHub",
  "Microsoft.AzureActiveDirectory",
"Microsoft.Web"]

vnet_subnets = {

  "snet-aks-nodes" = {
    address_prefixes                               = ["10.150.0.0/21"]
    enforce_private_link_endpoint_network_policies = true
    enforce_private_link_service_network_policies  = true
    service_delegation                             = false
    nsg_name                                       = "snet-aks-nodes"
  }

  "snet-aks-ingress" = {
    address_prefixes                               = ["10.150.8.0/24"]
    enforce_private_link_endpoint_network_policies = true
    enforce_private_link_service_network_policies  = true
    service_delegation                             = false
    nsg_name                                       = "snet-aks-ingress"
  }
}


tags = {

  "managedBy" = "terraform"
  "resource"  = "aks"
  "env"       = "POC"
}
