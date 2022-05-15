resource "google_compute_firewall" "provider" {
  for_each      = var.provider_vpc_firewall_rules
  project       = each.value.project
  name          = each.value.name
  network       = each.value.network
  description   = each.value.description
  source_ranges = each.value.source_ranges
  #  destination_ranges = each.value.destination_ranges
  direction = each.value.direction
  priority  = each.value.priority
  disabled  = each.value.disabled

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }


  allow {
    protocol = each.value.allow.protocol
    ports    = each.value.allow.ports
  }

  depends_on = [google_compute_network.vpc]

}

