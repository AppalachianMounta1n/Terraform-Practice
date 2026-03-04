//Set the instance IP as an output
output "ip" {
    value = google_compute_instance.vm_instance.network_interface.0.network_ip
}