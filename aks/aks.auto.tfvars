resource_group_name                  = "rg-azarc-aks"
azure_region                         = "centralus"
aks_subnet_name                      = "snet-azarc-aks"
aks_vnet_name                        = "vnet-azarc-aks"
aks_vnet_address_space               = ["10.150.0.0/19"]
aks_vnet_dns_servers                 = ["168.63.129.16"]
aks_nodepool_subnet_address_prefixes = ["10.150.0.0/21"]

api_server_authorized_ip_ranges = ["45.21.46.49"]

aks_cluster_name = "aks-azarc-mgmt"
#dns_prefix_private_cluster         = "mgmtazarcaks"
aks_cluster_dns_prefix             = "aksazarcmgmt"
automatic_channel_upgrade          = "stable"
kubernetes_version                 = "1.23.5"
aks_availability_zones             = ["1", "2", "3"]
aks_cluster_admin_group_object_ids = ["538d6845-8038-4cbe-8ab4-54b1b5930834"]
#system_node_pool_node_count = 1
system_node_pool_node_min_count = 1
system_node_pool_node_max_count = 2
system_node_pool_node_vm_size   = "Standard_B4ms"

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

aks_natgw_public_ip_zone = ["1"]
aks_nat_gateway_name     = "ngw-azarc-aks"

tags = {

  "provisioner" = "terraform"
  "category"    = "aks"
  "env"         = "dev"
  "org"         = "blackdevops"
}

ssh_public_key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBEpMg2U7xIPrQ0VVJoYExJEaPeSx3yVAoJmRHciH/C6GNNlsk1XEUz8Ty6y0xrJSBUghr+Wp9Xm5X2628GqyKjSg6kwtk9QxPrR1rqqOEIMg9UnYF15aBX4OvHVRlhvquKimCTYJ6TOukm0R8vm6xvJBWNtXRRaTm0lSE6vTkwmbZq43sEPp8YfubG4MrY3ukWy4Ktxbteo8sotVXZw8FnS7FUWVvzwsa/fGtrHClCXRdxLPTgqveyg3GfloozkMZEInFFPmVULo5TuDN9+ZS/FMKusMpN3VtxAPD+I679cw2odL/M3nNTrT6d6eC0wCIZAvtl41lf8d+W4g6YSuXOi2hOJM4DFYtggYnlW39WgkfpFyHbcy0xsWdZ6QM6V8U2zVnPR/14WX7Y1ywjG1YLDDYX/xOWpCJrYVDiOnmv1AD+A2wOONq566uVwsnj5KVPIewUfD9ZB3DRGUffilEg+gxtxZuO2LN87IFCE0boHYH0vhUcrq4klLt/fDWixE="