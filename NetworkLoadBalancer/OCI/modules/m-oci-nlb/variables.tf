variable "region" {}
variable "compartment_ocid" {}
variable "subnet_id" {}
variable "backend_set_policy" {
  default = "FIVE_TUPLE"
}
variable "lb_name_prefix" {
  default = "nf-lb"
}
variable "freeform_tag" {
  default = "terraform_nlb"
}
variable "backend_set_health_checker_interval_in_millis" {
  default =  10000
}
variable "backend_set_health_checker_retries" {
  default = 3
}
variable "backend_set_health_checker_timeout_in_millis" {
  default = 3000
}
variable "availability_domain" {
  default = 3
}
