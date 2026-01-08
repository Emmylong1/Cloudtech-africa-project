module "network" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"

  project_id   = var.project_id
  network_name = "${var.network_name}-${var.env_name}"

  subnets = [
    {
      subnet_name   = "${var.subnetwork_name}-${var.env_name}"
      subnet_ip     = "10.10.0.0/20"
      subnet_region = var.region
    }
  ]

  secondary_ranges = {
    "${var.subnetwork_name}-${var.env_name}" = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "10.30.0.0/20"
      }
    ]
  }
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "24.1.0"

  project_id        = var.project_id
  name              = "${var.cluster_name}-${var.env_name}"
  region            = var.region
  regional          = true

  network            = module.network.network_name
  subnetwork         = module.network.subnets_names[0]
  ip_range_pods      = var.ip_range_pods_name
  ip_range_services  = var.ip_range_services_name

  enable_private_nodes    = true
  enable_private_endpoint = false

  node_pools = [
    {
      name         = "default-pool"
      machine_type = var.node_machine_type
      node_locations = "africa-south1-a,africa-south1-b,africa-south1-c"

      min_count = 1
      max_count = 3
      disk_size_gb = 50
      autoscaling = true
    }
  ]
}
