# Deploy Resource Template uding Cli with parameters file

``` bash
az deployment group create \
  --name ExampleDeployment \
  --resource-group $ARM_RESOURCE_GROUP \
  --subscription $ARM_SUBSCRIPTION_ID \
  --template-file azure-deploy/SASE/saseDeploy.json \
  --parameters azure-deploy/SASE/saseDeploy.parameters.json
```
*Configure Envrionmental Variables ARM_RESOURCE_GROUP and ARM_SUBSCRIPTION_ID*

``` bash
Internet Explorer and Microsoft Edge on Windows 10-based computers use the WinHttp proxy service to retrieve proxy server information. The WinHttp Proxy service does not support using the ftp:// or file:// protocol for a PAC file.

To resolve this issue, host the PAC file on a web server, then refer to it by using the http protocol.
[More Here](https://docs.microsoft.com/en-us/troubleshoot/browsers/cannot-read-pac-file)
```


        


