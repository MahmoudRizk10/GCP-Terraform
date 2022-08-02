resource "google_compute_firewall" "allow-ssh" {
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion"]

  name    = "allow-ssh"
  network = google_compute_network.task-vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }

}