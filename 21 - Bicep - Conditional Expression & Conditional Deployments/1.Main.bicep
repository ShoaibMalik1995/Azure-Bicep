param environment string = 'Dev'
param location string = resourceGroup().location
param skuName string = (environment == 'Prod') ? 'S2' : 'S1'
param capacity int = (environment == 'Prod') ? 3 : 1
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

param deployAppService bool = true
param deploySQLDatabase bool = true
param deployAppInsights bool = true

// Module 1 - To Create App Service Plan, and App Service
module AppServicePlan '2.AzureAppService.bicep' = if(deployAppService) {
  name: 'AppServicePlan'
  params: {
    environment: environment
    location: location
    skuName: skuName
    capacity: capacity
    appServicePlanName: appServicePlanName
    webAppName: webAppName
    tags: tags
    appInsightsComponentsOutput: AppInsights.outputs.appInsightsComponentsOutput
  }
  dependsOn: [
    AppInsights
  ]
}

// Module 2 - To Create SQL Server and SQL Database
module AzureSQLDatabase '3.AzureSQLDatabase.bicep' = if(deploySQLDatabase) {
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

// Module 3 - To Create Application Insights
module AppInsights '4.AppInsights.bicep' = if(deployAppInsights) {
  name: 'AppInsights'
  params: {
    location: location
    appInsightsName: appInsightsName
    tags: tags
  }
}


