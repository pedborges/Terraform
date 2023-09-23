terraform {
  required_providers {
    azurerm = {
        source ="hashicorp/azurerm"
        version=">=3.0.0"
    }
  }
  /*yo need to create a variable.tf document and define yours variables*/
  /* use this code when you want keep the log changes about your terraform*/
      backend "azurerm" {
      resource_group_name = "your resource group name"
      storage_account_name="your sotrage acount name"
      container_name ="your container name"
      key="your key"

    }
  
}
provider "azurerm"{
    features {}
}

resource "azurerm_resource_group" "portifoliotf" {
    name="PortifolioTf"
    location=var.location
}

resource "azurerm_service_plan" "azsp" {
  name                = "portifoliotf-service-plan"
  location            = var.location
  resource_group_name = var.resourcegroup
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "azwa" {
   name               = "portifoliotf-web-app"
  resource_group_name = var.resourcegroup
  location            = var.location
  service_plan_id     = azurerm_service_plan.azsp.id

  site_config  {
    always_on                 = false
    app_command_line          = ""
    cors {
   allowed_origins     = ["https://pinguelliportifolio.web.app"]
   support_credentials = false 
  }
  }
   app_settings= {
    DOCKER_REGISTRY_SERVER_URL ="https://portifoliocr.azurecr.io"
    DOCKER_REGISTRY_SERVER_USERNAME = var.userDockerRegistry
    DOCKER_REGISTRY_SERVER_PASSWORD = var.password
  }
  

}

resource "azurerm_container_registry" "azcr" {
  name                = "Portifoliocr"
  resource_group_name = var.resourcegroup
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags = {
    environment = "deployment"
  }
}

resource "azurerm_storage_account" "azsa" {
  name                     = "portifoliosa"
  resource_group_name      = var.resourcegroup
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "deployment"
  }
}

resource "azurerm_storage_container" "azsc"{
    name = "portifoliocontainer"
    storage_account_name=azurerm_storage_account.azsa.name
    container_access_type="private"    
}

/* if you want to build a AKS service use this code!*/

/*resource "azurerm_kubernetes_cluster" "akc"{
  name                ="AKSPortifolio"
  location            = var.location
  resource_group_name =var.resourcegroup
  dns_prefix          = "portifolioks1"
  sku_tier="Free"

  default_node_pool {
    name       = "firstnode"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }
    identity {
    type = "SystemAssigned"
  }

}*/


