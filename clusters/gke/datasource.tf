data "google_service_account" "gke" {
  account_id = "svs-terraform-iac@slsfs-dev.iam.gserviceaccount.com"
}

output "service_account_id" {
  value = data.google_service_account.gke.email
}