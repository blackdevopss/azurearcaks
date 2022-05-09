variable "azuredevops_service_connection_name" {
  type = string
}

variable "subscription_name" {
  type = string
}

variable "azure_devops_environments" {
  type = map(object({
    name = string
  }))
}

variable "client_id" {
  type = string
}

variable "github_personal_access_token" {
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

variable "org_service_url" {
  type = string
}

variable "personal_access_token" {
  type = string
}

variable "azuredevops_project_name" {
  type = string
}

variable "azure_devops_projects" {
  type = map(object({
    visibility         = string
    version_control    = string
    work_item_template = string
    description        = string
    features = object({
      testplans    = string
      artifacts    = string
      boards       = string
      repositories = string
      pipelines    = string
    })
  }))
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}