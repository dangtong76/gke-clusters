resource "google_container_cluster" "primary" {
  name     = "gke-dangtong-cluster"
  location = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "gke-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# resource "google_container_cluster" "primary" {
#   name               = "kubedangtong"
#   description        = "Cluster for Education"
#   location           = var.region
#   min_master_version = "1.23"
#   initial_node_count = 1
#   network = google_compute_network.vpc.name 
#   subnetwork = google_compute_subnetwork.subnet.name
#   node_config {
#     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#     # service_account = google_service_account.
#     # service_account = google_service_account.default.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#     labels = {
#       env = var.project_id
#     }
#     tags = ["gke-node", "${var.project_id}-gke"]
#   }
#   timeouts {
#     create = "30m"
#     update = "40m"
#   }
# }