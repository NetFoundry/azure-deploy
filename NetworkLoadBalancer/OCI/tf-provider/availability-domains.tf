# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains

# <tenancy-ocid> is the compartment OCID for the root compartment.
# Use <tenancy-ocid> for the compartment OCID.

data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaapp7nygatdfqgpnxxncbuugrfbmuergecbn6x5mrbghat5qww5k3q"
}
