param location string = resourceGroup().location
param environment string
param envShort string
// App Service Plan and App Service
param appServicePlanName string
param webAppName string

// Application Insights
param appInsightsName string

// SQL Database and SQL Server
param sqlServerName string
param sqlDatabaseName string

param tags object = {
  environmentid: envShort
  environmentType: 'msk-${envShort}'
  costCenter: 'AIS'
}

// Configuration Set - To define the configuration settings for different environments
var vConfiguration = {  
  Development: {
    AppServicePlamFA: {  
      skuName: 'S1'
      capacity: 1
    }
    SQLDatabase: {  
      maxSizeBytes: '1073741824'
      collation: 'SQL_Latin1_General_CP1_CI_AS'
      sqlAdminLogin: 'mskadmin'
      sqlAdminPassword: 'P@ssw0rd@123'
    }
    
  }
  Production: {  
    AppServicePlamFA: {  
      skuName: 'S2'
      capacity: 3
    }
    SQLDatabase: {  
      maxSizeBytes: '1073741824'
      collation: 'SQL_Latin1_General_CP1_CI_AS'
      sqlAdminLogin: 'mskadmin'
      sqlAdminPassword: 'P@ssw0rd@456'
    }
    
  }
}

param deployAppService bool = true
param deploySQLDatabase bool = true
param deployAppInsights bool = true

// Module 1 - To Create App Service Plan, and App Service
module AppServicePlan '2.AzureAppService.bicep' = if(deployAppService) {
  name: 'AppServicePlan'
  params: {
    environment: environment
    location: location
    skuName: vConfiguration[environment].AppServicePlamFA.skuName
    capacity: vConfiguration[environment].AppServicePlamFA.capacity
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
    maxSizeBytes: vConfiguration[environment].SQLDatabase.maxSizeBytes
    collation: vConfiguration[environment].SQLDatabase.collation
    sqlServerName: sqlServerName
    sqlDatabaseName: sqlDatabaseName
    sqlAdminLogin: vConfiguration[environment].SQLDatabase.sqlAdminLogin
    sqlAdminPassword: vConfiguration[environment].SQLDatabase.sqlAdminPassword
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


