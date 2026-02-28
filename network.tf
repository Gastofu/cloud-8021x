# -----------------------------------------------------------------------------
# VPC
# -----------------------------------------------------------------------------

resource "google_compute_network" "radius" {
  project                 = google_project.this.project_id
  name                    = "radius-network"
  auto_create_subnetworks = false

  depends_on = [google_project_service.apis["compute.googleapis.com"]]
}

resource "google_compute_subnetwork" "radius" {
  project       = google_project.this.project_id
  name          = "radius-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.radius.id
}

# -----------------------------------------------------------------------------
# Static external IP
# -----------------------------------------------------------------------------

resource "google_compute_address" "radius" {
  project = google_project.this.project_id
  name    = "radius-static-ip"
  region  = var.region

  depends_on = [google_project_service.apis["compute.googleapis.com"]]
}

resource "google_compute_address" "radius_secondary" {
  project = google_project.this.project_id
  name    = "radius-static-ip-secondary"
  region  = var.region

  depends_on = [google_project_service.apis["compute.googleapis.com"]]
}

# -----------------------------------------------------------------------------
# Firewall rules
# -----------------------------------------------------------------------------

# RADIUS auth + accounting from UniFi APs
resource "google_compute_firewall" "allow_radius" {
  project = google_project.this.project_id
  name    = "allow-radius"
  network = google_compute_network.radius.id

  allow {
    protocol = "udp"
    ports    = ["1812", "1813"]
  }

  source_ranges = distinct(flatten([for k, v in var.radius_clients : v.cidrs]))
  target_tags   = ["radius-server"]
}

# SSH access (default: GCP IAP range only)
resource "google_compute_firewall" "allow_ssh" {
  project = google_project.this.project_id
  name    = "allow-ssh"
  network = google_compute_network.radius.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_allowed_cidrs
  target_tags   = ["radius-server"]
}

# Outbound — needed for package installs, Okta API calls, etc.
resource "google_compute_firewall" "allow_egress" {
  project   = google_project.this.project_id
  name      = "allow-egress"
  network   = google_compute_network.radius.id
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
}
