# Deploy Resource Template uding Cli with parameters file

``` bash
az deployment group create \
  --name ExampleDeployment \
  --resource-group $ARM_RESOURCE_GROUP \
  --subscription $ARM_SUBSCRIPTION_ID \
  --template-file azure-deploy/SASE/saseDeploy.json \
  --parameters azure-deploy/SASE/saseDeploy.parameters.json
```
!!! important
    Configure Envrionmnet Varaible ARM_RESOURCE_GROUP and ARM_SUBSCRIPTION_ID

        


