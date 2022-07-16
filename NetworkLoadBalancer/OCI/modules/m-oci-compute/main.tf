/*
    Resource Elements
*/
resource "oci_marketplace_accepted_agreement" "test_accepted_agreement" {
  agreement_id    = oci_marketplace_listing_package_agreement.test_listing_package_agreement.agreement_id
  compartment_id  = var.compartment_ocid
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
  signature       = oci_marketplace_listing_package_agreement.test_listing_package_agreement.signature
}
resource "oci_marketplace_listing_package_agreement" "test_listing_package_agreement" {
  agreement_id    = data.oci_marketplace_listing_package_agreements.test_listing_package_agreements.agreements[0].id
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
}
/*
    Data Elements
*/
data "oci_marketplace_listing_package_agreements" "test_listing_package_agreements" {
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
  compartment_id = var.compartment_ocid
}
data "oci_marketplace_listing_package" "test_listing_package" {
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
  compartment_id = var.compartment_ocid
}
data "oci_marketplace_listing_packages" "test_listing_packages" {
  listing_id = data.oci_marketplace_listing.test_listing.id
  compartment_id = var.compartment_ocid
}
data "oci_marketplace_listing" "test_listing" {
  listing_id     = data.oci_marketplace_listings.test_listings.listings[0].id
  compartment_id = var.compartment_ocid
}
data "oci_marketplace_listings" "test_listings" {
#  category       = ["security"]
  name = ["NetFoundry Edge Router"]
  compartment_id = var.compartment_ocid
}
data "oci_core_app_catalog_listing_resource_version" "test_catalog_listing" {
  listing_id = data.oci_marketplace_listing_package.test_listing_package.app_catalog_listing_id
  resource_version = data.oci_marketplace_listing_package.test_listing_package.app_catalog_listing_resource_version
}
/*
    Compute Resources
*/

resource "oci_core_instance" "backend_edge_router" {
  count               = var.num_instances
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "${var.instance_name_prefix}${count.index}"
  shape               = var.instance_shape

  shape_config {
    ocpus = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  create_vnic_details {
    subnet_id                 = var.subnet_id
    display_name              = "${var.instance_name_prefix}${count.index}-vnic"
    assign_public_ip          = true
    assign_private_dns_record = true
    skip_source_dest_check    = true
    hostname_label            = "${var.instance_name_prefix}${count.index}"
  }

  source_details {
    source_type = "image"
    source_id = data.oci_core_app_catalog_listing_resource_version.test_catalog_listing.listing_resource_id
  }

  metadata = {
    ssh_authorized_keys = file(var.er_ssh_public_key)
    user_data           = base64encode(local.user_data[count.index])
  }

  freeform_tags = {
    "creator" = "${var.freeform_tag}"
  }

  # crate operaiton time out
  timeouts {
    create = "60m"
  }
}

data "oci_core_instance_devices" "backend_edge_router_devices" {
  count       = var.num_instances
  instance_id = oci_core_instance.backend_edge_router[count.index].id
}
# Output the private and public IPs of the instance
output "instance_private_ips" {
  value = [oci_core_instance.backend_edge_router.*.private_ip]
}
output "instance_public_ips" {
  value = [oci_core_instance.backend_edge_router.*.public_ip]
}
# Output all the devices for all instances
output "instance_devices" {
  value = [data.oci_core_instance_devices.backend_edge_router_devices.*.devices]
}
data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_ocid
  ad_number      = 1
}