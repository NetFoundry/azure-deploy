# Deploy Resource Template uding Cli with parameters file

``` bash
az login --service-principal --username $ARM_CLIENT_ID --password $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID
az login --service-principal --username $ARM_CLIENT_ID --password="$ARM_CLIENT_SECRET" --tenant $ARM_TENANT_ID \\ if password start with dash -
az vm image list --location westeurope --offer Deb --publisher credativ --sku 8 --all --output table
az deployment group create \
  --name ExampleDeployment \
  --resource-group $ARM_RESOURCE_GROUP \
  --subscription $ARM_SUBSCRIPTION_ID \
  --template-file azure-deploy/SASE/saseDeploy.json \
  --parameters azure-deploy/SASE/saseDeploy.parameters.json
```
*Configure Envrionmental Variables ARM_RESOURCE_GROUP and ARM_SUBSCRIPTION_ID*

:warning: `az login -u <username> -p <password>` does not work if <password> starts with a hyphen #15493 
          [Add instruction for passing argument with leading dash](https://github.com/MicrosoftDocs/azure-docs-cli/pull/2318) 

# Deploying PAC file on Windows Computers

:warning: Internet Explorer and Microsoft Edge on Windows 10-based computers use the WinHttp proxy service to retrieve proxy server information. The WinHttp Proxy service does not support using the ftp:// or file:// protocol for a PAC file. To resolve this issue, host the PAC file on a web server, then refer to it by using the http protocol. [More on this here](https://docs.microsoft.com/en-us/troubleshoot/browsers/cannot-read-pac-file)

# Create SSL Proxy Certs and Ders
```bash
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout tcsca.pem -out tcsca.pem
openssl x509 -in tcsca.pem -outform DER -out tcsca.der
```


        


