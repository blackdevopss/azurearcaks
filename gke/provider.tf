terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.19.0"
    }
  }
}

provider "google" {
  project     = var.gcp_project_id
  credentials = file(var.gcp_credentials)
  region      = var.gcp_region
  # Configuration options
}


terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "azurearc-gke"
    }
  }
}