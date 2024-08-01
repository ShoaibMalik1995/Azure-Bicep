param location string = resourceGroup().location
param storageAccountName string
param storageAccountskuName string
param tags object

param appServicePlanName string
param aspSkuName string
param aspSkuCapacity int
param functionAppsArray array = [
  {
    name: 'msk-func-001-uks-dev'
  }
  {
    name: 'msk-func-002-uks-dev'
  }
  {
    name: 'msk-func-003-uks-dev'
  }
]

// Module - 1 To Create Storage Account
module StorageAccount '2.StorageAccount.bicep' = {
  name: 'StorageAccount'
  params: {
    location: location
    storageAccountName: storageAccountName
    skuName: storageAccountskuName
    tags: tags
  }
}

// Module - 2 To Create App Service Plan - Linux
module AppServicePlan_Linus '3.AppServicePlan-Linux.bicep' = {
  name: 'AppServicePlan'
  params: {
    appServicePlanName: appServicePlanName
    aspSkuName: aspSkuName
    aspSkuCapacity: aspSkuCapacity
    location: location
    tags: tags
  }
}

// Module - 4 To Create Application Insights
// module ApplicationInsights '4.ApplicationInsights.bicep' = {
//   name: 'ApplicationInsights'
//   params: {
//     location: location
//     appInsightsName: appInsightsName
//   }
// }

// Module - 4 To Create Azure Function App
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

