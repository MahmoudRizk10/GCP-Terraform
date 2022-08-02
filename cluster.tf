resource "google_container_cluster" "mycluster" {
  name               = "mycluster"
  location           = "us-central1-a"
  network = google_compute_network.task-vpc.id
  subnetwork = google_compute_subnetwork.restricted_subnet.id
  networking_mode = "VPC_NATIVE"
  
  remove_default_node_pool = true
  initial_node_count       = 1

  node_locations = [ 
    "us-central1-b" 
  ]

  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.48.0.0/14"
    services_ipv4_cidr_block = "10.52.0.0/20"
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  release_channel {
      channel = "STABLE"
  }

  workload_identity_config {
  workload_pool = "mahmoudrizk.svc.id.goog"
}

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "172.16.0.0/28"
      display_name = "External Control Plane access"
    }
  }

}