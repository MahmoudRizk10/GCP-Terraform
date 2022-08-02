resource "google_compute_subnetwork" "public" {
name = "public"
ip_cidr_range = "10.0.0.0/24"
region = "us-central1"
network = google_compute_network.task-vpc.id
}
resource "google_compute_subnetwork" "private" {
name = "private"
ip_cidr_range = "10.0.1.0/24"
region = "us-central1"
network = google_compute_network.task-vpc.id
}