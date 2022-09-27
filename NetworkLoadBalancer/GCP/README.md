## Deploy LoadBalancer and 2 Customer Hosted Edge Routers to your VPC Network

This terraform plan when used will create a new load balancer and 2 new NF Edge Routers in your existing VPC network. All NLB associated resources and options will be created/configured as well, among other things health checks to each ER, the lb algorithm will be set to "Five Tuple", and backend pool will be set to 2 ERs created part of this deployment. Obviously, one can add more ERs or change any configuration option once all the resources are created. The vcn name, subnet prefix, and route table name must be provided. It is recommended to use a dedicated subnet prefix for this deployment.

**PREREQUISITES** \
Need to Create 2 Customer Hosted Edge Routers on your NF Network using the following link [Get Reg Keys](https://nfconsole.io/login) and copy registration keys in the input variables file under nf_router_registration_key_list.

**STEPS** \
If you need such HA set up in more than one region, you can rerun it more than once. Just don't forget to change the region name. The next iteration of this deployment plan could be to  modify the input variables into a list, so one can deploy network load balancers in multiple regions at a time. This would also help with keeping the latet state of the deployed plan in one location for the entire network.

1. Install gcloud CLI

    [Get CLI](https://cloud.google.com/sdk/docs/install) 

2. Autheticate to use CLI
    `gcloud auth login --no-launch-browser`


3. Clone the repo and cd into NetworkLoadBalancer/OCI


* Run `gcloud help config` to learn how to change individual settings
* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the SDK like arg files and output formatting
* Run `gcloud cheat-sheet` to see a roster of go-to `gcloud` commands.