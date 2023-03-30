resource "google_compute_subnetwork" "subnet" {
  name = "${var.project_id}-subnet"
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = var.ip_cidr_range
}
