resource "google_dns_managed_zone" "provider" {
  name        = "main-private-zone"
  dns_name    = "blackdevops.com."
  project     = "slsfs-hub"
  description = "Main Private DNS zone"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.vpc["vpc-provider"].id
    }
  }
}