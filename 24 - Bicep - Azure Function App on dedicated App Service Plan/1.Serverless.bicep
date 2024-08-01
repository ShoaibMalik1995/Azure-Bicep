param location string = resourceGroup().location
param storageAccountName string
param storageAccountskuName string
param tags object

param appServicePlanName string
param aspSkuName string
param aspSkuCapacity int

param appInsightsName string
param functionAppName string

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
module ApplicationInsights '4.ApplicationInsights.bicep' = {
  name: 'ApplicationInsights'
  params: {
    location: location
    appInsightsName: appInsightsName
  }
}

// Module - 5 To Create Azure Function App
module AzureFunctionApp '5.AzureFunctionApp.bicep' = {
  name: 'AzureFunctionApp'
  params: {
    functionAppName: functionAppName
    location: location
    serverfarmsId: AppServicePlan_Linus.outputs.appServicePlanId
    tags: tags
  }
  dependsOn: [
    StorageAccount
    AppServicePlan_Linus
    ApplicationInsights
  ]
}

