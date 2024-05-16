terraform {
    backend "azurerm" {
    }
    required_providers {
        azurerm = {
            source= "hashicorp/azurerm" 
            version = "3.97.1" 
        }
    }
    required_version= ">= 1.0.8" 
}

provider "azurerm" { 
    subscription_id= var.subscription_id
    features {}
}