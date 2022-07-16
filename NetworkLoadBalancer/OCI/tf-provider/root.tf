variable "region" {}
variable "compartment_id" {}

module "vcn1" {
  source = "../modules/m-oci-vcn"
  region = "${var.region}"
  vcn_cidr = "10.100.0.0/16"
  subnet1_cidr = "10.100.0.0/24"
  compartment_ocid = "${var.compartment_id}"
}

module "compute1" {
  source = "../modules/m-oci-compute"
  region = "${var.region}"
  compartment_ocid = "${var.compartment_id}"
  er_ssh_public_key = "~/.ssh/id_rsa.pub"
  subnet_id = module.vcn1.subnet_id
  er_reg_keys = ["QMDJSK49F5","V9SP1X08X4"]
}

module "nlb1" {
  source = "../modules/m-oci-nlb"
  region = "${var.region}"
  compartment_ocid = "${var.compartment_id}"
  subnet_id = module.vcn1.subnet_id
}
output "instance_private_ips" {value = [module.compute1.instance_private_ips]}
output "instance_public_ips" {value = [module.compute1.instance_public_ips]}
