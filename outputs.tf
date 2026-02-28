output "project_id" {
  description = "The created GCP project ID"
  value       = google_project.this.project_id
}

output "radius_primary_ip" {
  description = "Primary RADIUS server public IP"
  value       = google_compute_address.radius.address
}

output "radius_secondary_ip" {
  description = "Secondary (failover) RADIUS server public IP"
  value       = google_compute_address.radius_secondary.address
}

output "ssh_command_primary" {
  description = "SSH into the primary VM via IAP tunnel"
  value       = "gcloud compute ssh radius-primary --zone=${var.zone} --project=${google_project.this.project_id} --tunnel-through-iap"
}

output "ssh_command_secondary" {
  description = "SSH into the secondary VM via IAP tunnel"
  value       = "gcloud compute ssh radius-secondary --zone=${var.secondary_zone} --project=${google_project.this.project_id} --tunnel-through-iap"
}

output "unifi_radius_config" {
  description = "Values for UniFi RADIUS server profile — configure both primary and secondary servers"
  value = {
    primary_server_ip   = google_compute_address.radius.address
    secondary_server_ip = google_compute_address.radius_secondary.address
    auth_port           = 1812
    accounting_port     = 1813
    shared_secrets      = { for k, v in google_secret_manager_secret.radius_secret : k => v.secret_id }
  }
}
