aks_cluster_name                   = "aks-poc-clus01"
aks_cluster_dns_prefix             = "akspocclus01"
automatic_channel_upgrade          = "stable"
kubernetes_version                 = "1.23.5"
aks_cluster_admin_group_object_ids = ["538d6845-8038-4cbe-8ab4-54b1b5930834"]
system_node_pool_node_min_count    = 1
system_node_pool_node_max_count    = 2
system_node_pool_node_vm_size      = "Standard_B4ms"
azure_region                       = "centralus"
admin_username                     = "blackdevops"

tags = {

  "provisioner" = "terraform"
  "category"    = "aks"
  "env"         = "dev"
  "org"         = "blackdevops"
}

ssh_public_key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBEpMg2U7xIPrQ0VVJoYExJEaPeSx3yVAoJmRHciH/C6GNNlsk1XEUz8Ty6y0xrJSBUghr+Wp9Xm5X2628GqyKjSg6kwtk9QxPrR1rqqOEIMg9UnYF15aBX4OvHVRlhvquKimCTYJ6TOukm0R8vm6xvJBWNtXRRaTm0lSE6vTkwmbZq43sEPp8YfubG4MrY3ukWy4Ktxbteo8sotVXZw8FnS7FUWVvzwsa/fGtrHClCXRdxLPTgqveyg3GfloozkMZEInFFPmVULo5TuDN9+ZS/FMKusMpN3VtxAPD+I679cw2odL/M3nNTrT6d6eC0wCIZAvtl41lf8d+W4g6YSuXOi2hOJM4DFYtggYnlW39WgkfpFyHbcy0xsWdZ6QM6V8U2zVnPR/14WX7Y1ywjG1YLDDYX/xOWpCJrYVDiOnmv1AD+A2wOONq566uVwsnj5KVPIewUfD9ZB3DRGUffilEg+gxtxZuO2LN87IFCE0boHYH0vhUcrq4klLt/fDWixE="