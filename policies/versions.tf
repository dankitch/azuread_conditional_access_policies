terraform {
  required_version = ">=1.6.2"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.44.1"
    }
  }
  backend "azurerm" {
  }

}

provider "azuread" {
}
