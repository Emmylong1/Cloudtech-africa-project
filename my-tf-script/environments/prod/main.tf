module "gke" {
  source = "../../modules/gke"

  project_id = var.project_id
  region     = var.region
  env_name   = var.env_name

  cluster_name = "my-gke"
  network_name = "gke-vpc"
  subnetwork_name = "gke-subnet"

  ip_range_pods_name     = "pods"
  ip_range_services_name = "services"
}
