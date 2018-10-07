#! /usr/bin/pwsh

# Region
$region = "East US"

# Resource Names
$resourceName = "MyApp-Dev-RG"

# Create a resource group.
az group delete --name $resourceName --yes
