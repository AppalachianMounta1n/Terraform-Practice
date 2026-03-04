//Configure provider
provider "google" {
    project = var.project
    region = var.region
    zone = var.zone
}

//Configure VPC network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

//Configure VM instance
resource "google_compute_instance" "vm_instance" {
    name = "basic-vm"
    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
            image = var.disk_image
        }
    }

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