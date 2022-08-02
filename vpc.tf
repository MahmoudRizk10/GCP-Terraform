resource "google_compute_network" "task-vpc" {
project = "mahmoudrizk"
name = "task-vpc"
auto_create_subnetworks = false
routing_mode = "REGIONAL"
}   