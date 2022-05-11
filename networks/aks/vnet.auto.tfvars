resource_group_name                  = "rg-aks-clusters"
azure_region                         = "centralus"
aks_subnet_name                      = "snet-azarc-aks"
aks_vnet_name                        = "vnet-azarc-aks"
aks_vnet_address_space               = ["10.150.0.0/19"]
aks_nodepool_subnet_address_prefixes = ["10.150.0.0/21"]

vnet_service_endpoints = [
  "Microsoft.Storage",
  "Microsoft.Sql",
  "Microsoft.ContainerRegistry",
  "Microsoft.AzureCosmosDB",
  "Microsoft.KeyVault",
  "Microsoft.ServiceBus",
  "Microsoft.EventHub",
  "Microsoft.AzureActiveDirectory",
"Microsoft.Web"]


tags = {

  "provisioner" = "terraform"
  "resource"    = "aks"
  "env"         = "poc"
  "org"         = "blackdevops"
}
