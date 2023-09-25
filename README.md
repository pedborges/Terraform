IaC exemplo de implantação Azure utilizando Hashicorp Terraform
Este IaC criará os seguintes recursos:
- Um resource group;
- Um Azure service plan;
- Um Azure app Service;
- Um Azure Container Registry
- Um Azure Storage Account
- Um Azure Storage Container
- Um Kubernetes AKS (Desativado)



Pré requisitos:
Será necessário criar um arquivo variables.tf contendo os seguintes dados:

variable "resourcegroup"{
    default = "your resource group name"

}
variable "location"{
    default="your selected location"
}
variable "password"{
    default="your container password"
}
variable "userDockerRegistry"{
    default = "you user container registry"
}
variable "storageAccountName"{
    default="your storage account name"
}
variable "containerName"{
    default="your container name"
}
variable "storageAccountKey"{
    default="your storage account key"
}

Faça um Fork do repositório e utilize a cópia conforme necessitar.
Altere os nomes dos recursos e inclusão/remoção conforme sua necessidade.
