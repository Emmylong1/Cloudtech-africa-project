terraform {
 backend "gcs" {
   bucket  = "devops-bucket12"
   prefix  = "terraform/state"
 }

}
