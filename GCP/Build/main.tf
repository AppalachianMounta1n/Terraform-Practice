terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "6.8.0"
        }
    }
}

provider "google" {
    project = "learn-terraform-for-gcp-489218"
    region = "us-west1"
    zone = "us-west1-a"
}

resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
}