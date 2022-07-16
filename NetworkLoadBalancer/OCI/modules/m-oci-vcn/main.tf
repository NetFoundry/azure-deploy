
resource "oci_core_vcn" "vcn1" {
  cidr_block     = "${var.vcn_cidr}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.vcn_name}_vcn1"
  dns_label      = "${var.vcn_name}vcn1"
  freeform_tags = {
		"creator" = "${var.freeform_tag}"
	}
}

resource "oci_core_subnet" "subnet1" {
  cidr_block          = "${var.subnet1_cidr}"
  display_name        = "${var.vcn_name}_sn1"
  dns_label           = "${var.vcn_name}sn1"
  security_list_ids   = [oci_core_security_list.securitylist1.id]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = oci_core_vcn.vcn1.id
  route_table_id      = oci_core_route_table.routetable1.id
  dhcp_options_id     = oci_core_vcn.vcn1.default_dhcp_options_id
  freeform_tags = {
		"creator" = "${var.freeform_tag}"
	}

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_internet_gateway" "internetgateway1" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.vcn_name}_igw01"
  vcn_id         = oci_core_vcn.vcn1.id
  freeform_tags = {
		"creator" = "${var.freeform_tag}"
	}
}

resource "oci_core_route_table" "routetable1" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = oci_core_vcn.vcn1.id
  display_name   = "${var.vcn_name}_rt1"
  freeform_tags = {
		"creator" = "${var.freeform_tag}"
	}

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internetgateway1.id
  }
}

resource "oci_core_security_list" "securitylist1" {
  display_name   = "${var.vcn_name}_sl1"
  compartment_id = oci_core_vcn.vcn1.compartment_id
  vcn_id         = oci_core_vcn.vcn1.id
  freeform_tags = {
		"creator" = "${var.freeform_tag}"
	}

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
}

output "vcn_id" {
  value = oci_core_vcn.vcn1.id
}
output "subnet_id" {
  value = oci_core_subnet.subnet1.id
}
