terraform {
  required_providers {
    google = {
      source                = "hashicorp/google"
      version               = "4.19.0"
      configuration_aliases = [google.provider, google.consumer]
    }
  }
}

provider "google" {
  project     = var.project_id
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = var.gcp_region
  alias       = "provider"
}

provider "google" {
  project     = var.project_id
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = var.gcp_region
  alias       = "consumer"
}

provider "google" {
  project     = var.project_id
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = var.gcp_region
}

terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "gcp-eks-network"
    }
  }
}
