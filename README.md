<h1>IaC exemplo de implantação Azure utilizando Hashicorp Terraform</h1>

## 💻Este IaC criará os seguintes recursos:
- Um Azure Resource Group;
- Um Azure service plan;
- Um Azure App Service;
- Um Azure Container Registry
- Um Azure Storage Account
- Um Azure Storage Container
- Um Kubernetes AKS (Desativado)



## ✅ Pré requisitos:
Será necessário criar um arquivo variables.tf contendo os seguintes dados:

![image](https://github.com/pedborges/Terraform/assets/110577886/e2dc9667-4f4f-4ee9-b2d5-65096714d800)


Faça um Fork do repositório e utilize a cópia conforme necessitar.


Altere os nomes dos recursos e inclusão/remoção conforme sua necessidade.

## ℹ️ Dúvidas:

Acesse:

Create an Azure service principal with the Azure CLI

https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?toc=%2Fazure%2Fazure-resource-manager%2Ftoc.json&view=azure-cli-latest?WT.mc_id=AZ-MVP-5001893

How to: Use the portal to create an Azure AD application and service principal that can access resources

https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal?WT.mc_id=AZ-MVP-5001893

Terraform with Azure

https://docs.microsoft.com/en-us/azure/developer/terraform/overview?WT.mc_id=AZ-MVP-5001893
