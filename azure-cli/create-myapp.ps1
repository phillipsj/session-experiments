#! /usr/bin/pwsh

# Region
$region = "East US"

# Resource Names
$resourceName = "MyApp-Dev-RG"
$planName = "MyApp-Dev-AP"
$appName = "MyApp-Dev-AS"

# Tags
$costCenter = "Demo"
$contact = "Jamie"
$managed = "Terraformed"
$environment = "Dev"

# Create a resource group.
az group create --location $region --name $resourceName --tags CostCenter=$costCenter Contact=$contact Managed=$managed Environment=$environment

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $planName --resource-group $resourceName --sku FREE --tags CostCenter=$costCenter Contact=$contact Managed=$managed Environment=$environment

# Create a web app.
az webapp create --name $appName --resource-group $resourceName --plan $planName --tags CostCenter=$costCenter Contact=$contact Managed=$managed Environment=$environment

# Set HTTPS Only.
az webapp update --resource-group $appName --name $resourceName --set httpsOnly=true