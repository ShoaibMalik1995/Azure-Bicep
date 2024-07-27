param location string = resourceGroup().location
param skuName string = 'S1'
param capacity int = 1
param appServicePlanName string = 'msk-appserviceplan-uks-dev'
param webAppName string = 'msk-webapp-uks-dev'
param appInsightsName string = 'msk-appinsights-uks-dev'

param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

param maxSizeBytes string  = '0'
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param sqlServerName string = 'msk-sqlserver-uks-dev'
param sqlDatabaseName string = 'msk-sqldatabase-uks-dev'


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


