# Azure Bicep - Create Multiple Azure Function Apps - Using Loops

## Overview
In this section, we will learn how to create multiple Azure Function Apps using loops in Bicep. We will set up multiple function apps and associated Application Insights instances specific to each function app using loops. We'll build upon the template from the last session, updating the serverless.bicep and Azure Function App Bicep files to deploy multiple function apps. The storage account and app service plan will be shared components among these function apps, while each function app will have its own dedicated Application Insights instance.

## Approaches for Creating Multiple Function Apps
There are multiple approaches for creating multiple functions using loops:

## Example 1 - Using a Parameter Array
You can use a parameter array of names and loop through it to create multiple function apps.
```bicep
param functionAppsArray array = [
  {
    name: 'msk-func-001-uks-dev'
  }
  {
    name: 'msk-func-002-uks-dev'
  }
]
module AzureFunctionApp '5.AzureFunctionApp.bicep' = [for functionAppName in functionAppsArray: {
  name: functionAppName.name
  params: {
    functionAppName: functionAppName
    location: location
    serverfarmsId: AppServicePlan_Linus.outputs.appServicePlanId
    tags: tags
    storageAccountId: StorageAccount.outputs.storageAccountId
    storageAccountName: StorageAccount.outputs.storageAccountName
    appInsightsName: '${functionAppName.name}-appInsights'
  }
  dependsOn: [
    StorageAccount
    AppServicePlan_Linus
  ]
}]

```

## Example 2 - Using a Start Index and Count
The second approach is to use the start index and based on the count, loop through using the range and create the function apps.

```bicep
param indexStart int = 1
param faCount int = 3
param functionAppName = 'msk-func-uks-dev'
module AzureFunctionApp '5.AzureFunctionApp.bicep' = [for index in range(indexStart, faCount): {
  name: '${functionAppName}-${index}'
  params: {
    functionAppName: functionAppName
    location: location
    serverfarmsId: AppServicePlan_Linus.outputs.appServicePlanId
    tags: tags
    storageAccountId: StorageAccount.outputs.storageAccountId
    storageAccountName: StorageAccount.outputs.storageAccountName
    appInsightsName: '${functionAppName}-${index}-ai'
  }
  dependsOn: [
    StorageAccount
    AppServicePlan_Linus
  ]
}]

```