
## Deploy LoadBalancer and 2 Ziti Edge Routers with 2 Ubuntu Client VMs to your Resource Group

I have tested two way to deply this:
1. az cli

**Note**
    Update the paramters file to match your Azure and Ziti configuration, and install azure cli for your os

```
git git@github.com:netfoundry/azure-deploy.git
cd azure-deploy/OpenZiti/Azure/azure-ziti-lb
az deployment group create --resource-group DariuszZttv --template-file .\template.json --parameters .\parameters.json
```
2. Using Azure Button
[![Deploy to Azure](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FNetFoundry%2Fazure-deploy%2FupdateManagedAppMEC%2FOpenZiti%2FAzure%2Fazure-ziti-lb%2Ftemplate.json)