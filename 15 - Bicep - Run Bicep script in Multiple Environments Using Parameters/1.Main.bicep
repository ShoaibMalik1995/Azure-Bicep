param location string = resourceGroup().location
param skuName string
param capacity int
param appServicePlanName string
param webAppName string
param appInsightsName string

param tags object

param maxSizeBytes string
param collation string
param sqlServerName string
param sqlDatabaseName string


// Module 1 - To Create App Service Plan, App Service and integrate with Application Insights
module AppServicePlan '2.AzureAppService.bicep' = {
  name: 'AppServicePlan'
  params: {
    location: location
    skuName: skuName
    capacity: capacity
    appServicePlanName: appServicePlanName
    webAppName: webAppName
    appInsightsName: appInsightsName
    tags: tags
  }
}

// Module 2 - To Create SQL Server and SQL Database
module AzureSQLDatabase '3.AzureSQLDatabase.bicep' = {
  name: 'AzureSQLDatabase'
  params: {
    location: location
    maxSizeBytes: maxSizeBytes
    collation: collation
    sqlServerName: sqlServerName
    sqlDatabaseName: sqlDatabaseName
    tags: tags
  }
}

