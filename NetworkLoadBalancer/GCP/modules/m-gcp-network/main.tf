

resource "google_compute_network" "vpc_net" {
  count = var.create_vcn ? 1 : 0
  name = var.vcn_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "nf_public_sn_01" {
  count = var.create_vcn ? 1 : 0
  name = var.nf_subnet_name
  ip_cidr_range = var.nf_subnet_cidr
  region = var.region
  network = google_compute_network.vpc_net[count.index].id
}

data "google_compute_network" "vpc_net" {
  count = var.create_vcn ? 0 : 1
  name = var.vcn_name
}

resource "google_compute_subnetwork" "nf_public_sn_02" {
  count = var.create_vcn ? 0 : 1
  name = var.nf_subnet_name
  ip_cidr_range = var.nf_subnet_cidr
  region = var.region
  network = data.google_compute_network.vpc_net[count.index].id
}

resource "google_compute_firewall" "fw_ssh" {
  name        = "nf-fw-ssh"
  network     = var.vcn_name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["nf-fw-rules"]
}

resource "google_compute_firewall" "fw_hc" {
  name        = "nf-fw-hc"
  network     = var.vcn_name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["8081"]
  }

  source_ranges =  ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags = ["nf-fw-rules"]
}