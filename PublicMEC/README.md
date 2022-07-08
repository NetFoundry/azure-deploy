**Connect to the cluster**

To manage a Kubernetes cluster, use the Kubernetes command-line client, kubectl. kubectl is already installed if you use Azure Cloud Shell.

1. Install kubectl locally using the az aks install-cli command:

***Azure CLI***

```bash
az aks install-cli
```

2. Configure kubectl to connect to your Kubernetes cluster using the az aks get-credentials command. The following command:

* Downloads credentials and configures the Kubernetes CLI to use them.
* Uses ~/.kube/config, the default location for the Kubernetes configuration file. Specify a different location for your Kubernetes configuration file using --file argument.
```bash
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
```

3. Verify the connection to your cluster using the kubectl get command. This command returns a list of the cluster nodes.
```bash
kubectl get nodes
```

The following output example shows the single node created in the previous steps. Make sure the node status is Ready:
```bash
NAME                       STATUS   ROLES   AGE     VERSION
aks-nodepool1-31718369-0   Ready    agent   6m44s   v1.12.8
```

```bash
az deployment group create --name dariuszaks --subscription "d8cde576-86a1-437f-863e-8d1e30d9a58b"   --resource-group "dariusz.sliwinski" --template-file template.json --parameters parameters.json
```

kubectl apply -f nginx-manifest.yaml