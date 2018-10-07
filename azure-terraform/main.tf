# Configure the Azure Provider
provider "azurerm" {
  version = "~> 1.16"
}

# Tags for reuse
locals {
  tags = {
    CostCenter  = "Demo"
    Contact     = "Jamie"
    Managed     = "Terraformed"
    Environment = "Dev"
  }
}

# Create a resource group
resource "azurerm_resource_group" "myApp" {
  name     = "MyApp-Dev-RG"
  location = "${var.region}"

  tags = "${local.tags}"
}

resource "azurerm_app_service_plan" "myApp" {
  name                = "MyApp-Dev-AP"
  location            = "${azurerm_resource_group.myApp.location}"
  resource_group_name = "${azurerm_resource_group.myApp.name}"

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = "${local.tags}"
}

resource "azurerm_app_service" "myApp" {
  name                = "MyApp-Dev-AP"
  location            = "${azurerm_resource_group.myApp.location}"
  resource_group_name = "${azurerm_resource_group.myApp.name}"
  app_service_plan_id = "${azurerm_app_service_plan.myApp.id}"
  https_only          = true

  tags = "${local.tags}"
}
