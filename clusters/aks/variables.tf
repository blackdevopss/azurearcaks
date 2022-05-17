variable "aks_cluster_name" {
  type = string
}
variable "aks_cluster_dns_prefix" {
  type = string
}

variable "admin_user_name" {
  type = string
}

variable "automatic_channel_upgrade" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "aks_cluster_admin_group_object_ids" {
  type = list(string)
}

variable "system_node_pool_node_min_count" {
  type = number
}

variable "system_node_pool_node_max_count" {
  type = number
}

variable "system_node_pool_node_vm_size" {
  type = string
}

variable "ssh_public_key_data" {
  type = string

}

variable "azure_region" {
  type = string
}

variable "tags" {
  type = map(string)
}