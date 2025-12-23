variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "demo-cluster-1"
}

variable "env_name" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}


variable "network_name" {
  description = "VPC network for the GKE cluster"
  type        = string
  default     = "gke-network"
}

variable "subnetwork_name" {
  description = "Subnetwork for the GKE cluster"
  type        = string
  default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  description = "Secondary IP range for GKE pods"
  type        = string
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "Secondary IP range for GKE services"
  type        = string
  default     = "ip-range-services"
}
