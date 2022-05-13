resource_group_name                  = "rg-arc-aks-poc"
azure_region                         = "centralus"
vnet_name                            = "vnet-arc-aks-poc"
vnet_address_space                   = ["10.150.0.0/19"]
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

  "managedBy" = "terraform"
  "resource"  = "aks"
  "env"       = "POC"
}
