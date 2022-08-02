# Cloud Router
resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.task-vpc.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}
resource "google_compute_address" "ipnat" {
  name = "ipnat"
  project = "mahmoudrizk"
  region  = "us-central1"
} 
# NAT Gateway
resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ips = [ google_compute_address.ipnat.self_link ]

   subnetwork {
    name                    = google_compute_subnetwork.managment_subnet.id
    source_ip_ranges_to_nat = ["10.0.0.0/24"]
  }
  subnetwork {
    name                    = "restricted_subnet"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}