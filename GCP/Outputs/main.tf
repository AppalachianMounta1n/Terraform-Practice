//Main Terraform Block
terraform {
  required_providers {
    //Configure Google Provider and Version
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

//Configure Google Provider with Project ID, Region, and zone
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

//Basic VPC Network Configuration
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

//Basic f1-micro instance of GCP's Container-Optimized OS
resource "google_compute_instance" "vm_instance" {
    name = "terraform-instance"
    machine_type = "f1-micro"
    tags = ["web", "dev"]

    //OS Config Settings
    boot_disk {
        initialize_params {
            image = "cos-cloud/cos-stable"
        }
    }

    //VPC Network for the instance
    network_interface {
        network = google_compute_network.vpc_network.name
        access_config {

        }
    }
}

//Configure Firewall Rules
resource "google_compute_firewall" "firewall_rules" {
    name = "basic-firewall"
    network = google_compute_network.vpc_network.name

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports = ["80", "8080", "1000-2000"]
    }

    source_tags = ["web"]
}