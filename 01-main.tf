# Reference   : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# Description : The Azure Provider can be used to configure infrastructure in Microsoft Azure using the Azure Resource Manager API's.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.95.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Reference  : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
# Description: Azure automatically deletes any Resources nested within the Resource Group when a Resource Group is deleted.
resource "azurerm_resource_group" "rg" {
  name     = "${local.group_name}-rg"
  location = var.resource_group_location
}


