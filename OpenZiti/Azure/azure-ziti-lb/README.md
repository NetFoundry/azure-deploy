
## Deploy LoadBalancer and 2 Ziti Edge Routers with 2 Ubuntu Client VMs to your Resource Group

[!PREREQUISITES]
    This template is created to work with the Zit network created with OpenZiti Quickstart that can be found [ExpressInstall](https://openziti.github.io/ziti/quickstarts/network/hosted.html). Scroll down to the Express Install section and follow the steps to install the Ziti Controller and Public Router. Once you have the controller DNS name and Password, then you can use the templates created here.

[!Note]
    Here are the steps to create HA Infra (2 Ziti ERs, Network Load Balancer and 2 CLient Ubuntu VMs for testing in the Azure Region. You wil probaly need at least two regions. You can use Azure Cli or Azure Button.

1. az cli
[!Important]
    Update the paramters file to match your Azure Cloud / Ziti configurations, and install azure cli for your os

```
git git@github.com:netfoundry/azure-deploy.git
cd azure-deploy/OpenZiti/Azure/azure-ziti-lb
az deployment group create --resource-group DariuszZttv --template-file .\template.json --parameters .\parameters.json
```
2. Using Azure Button
[![Deploy to Azure](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FNetFoundry%2Fazure-deploy%2FupdateManagedAppMEC%2FOpenZiti%2FAzure%2Fazure-ziti-lb%2Ftemplate.json)