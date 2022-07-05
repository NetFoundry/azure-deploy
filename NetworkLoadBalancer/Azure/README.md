
## Deploy LoadBalancer and 2 Customer Hosted Edge Routers to your Resource Group
This arm template when used will create a new load balancer and 2 new NF Edge Routers in your existing/new resource group. All NLB associated resources and options will be created/configured as well, among other things health checks to each ER, the lb algorithm will be set to "SourceIPProtocol", and backend pool will be set to 2 ERs created part of this deploymnet. Obviously, one can add more ERs or change any configuration option once all the resources are created. The vnet and route table names must be provided either of existing resources or new unique names to be used for creation of such resources. It is recommended to use a new or existing dedicated subnet prefix for this deployment.

***PREREQUISITES***
    Need to Create 2 Customer Hosted Edge Routers on your NF Network using the [Get Reg Keys](https://nfconsole.io/login) and save registration keys

***STEPS***
    Here are the steps to create HA Infra (2 NF Backend ERs, Network Load Balancer in the Azure Region. If you need more than one reion, you can rerun it more than once. Just dont forget to change the region name. You can use Azure Cli or Azure Button.

1. az cli

***IMPORTANT***
    Update the parameters file to match your Azure Cloud / Ziti configurations, and install azure cli for your os

```
git git@github.com:netfoundry/azure-deploy.git
cd azure-deploy/NetworkLoadBalancer/Azure
az deployment group create --resource-group "Your RG" --template-file .\template.json --parameters .\parameters.json
```
2. Using Azure Button
[![Deploy to Azure](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FNetFoundry%2Fazure-deploy%2Ffeature%2FCLOUDDEV-976%2FNetworkLoadBalancer%2FAzure%2Ftemplate.json)