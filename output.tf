output "kubernetes_cluster_name" {
    value = google_container_cluster.primary.name
    description = "Google Kubernetes Cluster Name"
}