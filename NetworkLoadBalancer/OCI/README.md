
## Deploy LoadBalancer and 2 Customer Hosted Edge Routers to your Resource Group
This arm template when used will create a new load balancer and 2 new NF Edge Routers in your existing/new resource group. All NLB associated resources and options will be created/configured as well, among other things health checks to each ER, the lb algorithm will be set to "SourceIPProtocol", and backend pool will be set to 2 ERs created part of this deploymnet. Obviously, one can add more ERs or change any configuration option once all the resources are created. The vnet and route table names must be provided either of existing resources or new unique names to be used for creation of such resources. It is recommended to use a new or existing dedicated subnet prefix for this deployment.

***PREREQUISITES***
    Need to Create 2 Customer Hosted Edge Routers on your NF Network using the [Get Reg Keys](https://nfconsole.io/login) and save registration keys

***STEPS***
    If you need such HA set up in more than one region, you can rerun it more than once. Just don't forget to change the region name. You can use Azure Cli or Azure Button.

1. az cli

***IMPORTANT***
    Update the parameters file to match your Azure Cloud / NetFoundry configurations, and install azure cli for your os. If you want to change any of the default values, you can just add the new value to the parameters file, i.e.

***Terraform***

To run these modules for AWS, one need to install .aws configure
file and all the different keys for all NF accounts.

This also configures an ip on the second interface, but the bash script
(ifcfg-eth1.sh) needs to be add in the home directory.

Example how to use modules. Builkd top level .tf file with declaration like so:

module "vpc1" {
  source = ".//modules/edge/m-aws-vpc"
  awsRegion = "us-east-2"
  public_subnet_cidr = 
  private_subnet_cidr = 
}
module "vm1" {
  source = ".//modules/m-aws-instance"
  awsRegion = "us-east-2"
  nfnKey = "598C3B56F004C1F09124668CB5F542610621C4AC"
  ami    = "ami-08b73ab007b78538e"
  sgId   = "${module.vpc1.sgId}"
  keyPairId = "${module.vpc1.keyPairId}"
  publicSubnetId = "${module.vpc1.publicSubnetId}"
  privateSubnetId = "${module.vpc1.privateSubnetId}"
}
output "public_ips" {value = [module.vm1.instance_public_ips]}
output "private_ips" {value = [module.vm1.instance_private_ips]}