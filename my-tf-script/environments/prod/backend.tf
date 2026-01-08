terraform {
  backend "gcs" {
    bucket  = "my-tf-state-prod"
    prefix  = "gke"
  }
}

