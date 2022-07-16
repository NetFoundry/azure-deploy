variable "region" {}
variable "compartment_ocid" {}
variable "vcn_name" {
    default = "vcnnlb"
}
variable "vcn_cidr" {}
variable "subnet1_cidr" {}
variable "freeform_tag" {
    default = "terraform_nlb"
}
