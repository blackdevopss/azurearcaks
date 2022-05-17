variable "aks_cluster_name" {
  type = string
}
variable "aks_cluster_dns_prefix" {
  type = string
}

variable "admin_username" {
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

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}