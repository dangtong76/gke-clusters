variable "project_id" {
  description = "Project ID of Google Cloud Platform"
  default = "groovy-smithy-382209"
  type = string
}

variable "region" {
  description = "Region of Google Cloud Platform"
  default = "asia-northeast3"
  type = string
}

variable "ip_cidr_range" {
  description = "CIDE range for gke kubernetes cluster"
  type = string
}