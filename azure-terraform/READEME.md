# Creating Azure Resources using Terraform

The basics for this expirment is to create the following:

* Reource Group
* App Service Plan
* App Service

Each resource needs to have the following four tags.

* CostCenter
* Managed
* Contact
* Environment

All of  these need to follow the folling naming standard.

```
<App Name>-<Environment>-Type

An example for resource group:

    MyApp-Dev-RG

An example for App Service Plan:

    MyApp-Dev-AP
```

Lastly, the App Service needs to be configured to be HTTPS Only.

## First Trial

The first trial is to create the following above using the Azure Portal. Time it to see how long it takes.

## Second Trial

The second trial is to create the following using Terraform. Time it to see how long it takes.

