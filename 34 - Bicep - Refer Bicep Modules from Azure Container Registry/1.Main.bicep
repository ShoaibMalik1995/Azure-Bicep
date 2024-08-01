// Commom Parameters
param location string = resourceGroup().location
param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

// App Service Module Parameters
param appInsightsName string = 'msk-appinsights-uks-dev'
param appServicePlanName string = 'msk-appserviceplan-uks-dev'
param capacity int = 1
param skuName string = 'S1'
param webAppName string = 'msk-webapp-uks-dev'

// SQL Database Module Parameters
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param maxSizeBytes string  = '0'
param sqlServerName string = 'msk-sqlserver-uks-dev'
param sqlDatabaseName string = 'msk-sqldatabase-uks-dev'
#disable-next-line secure-secrets-in-params   // Doesn't contain a secret
param sqlAdminLogin string = 'mskadmin'
#disable-next-line secure-secrets-in-params   // Doesn't contain a secret
param sqlAdminPassword string = 'P@ssw0rd1234'

// Storage Account Module Parameters
param storageAccountName string = 'mskstorageaccountuksdev'
param storageAccountSkuName string = 'Standard_LRS'

//  Create an Application Insights resource
module appInsights '../14 - Bicep - Communication between Bicep Modules using Output Parameters/4.AppInsights.bicep' = {
  name: 'appInsights'
  params: {
    location: location
    appInsightsName: appInsightsName
    tags: tags
  }
}

// Use App Service module from Azure Container Registry
module appservice_module 'br:mskacrregistryuksdev.azurecr.io/bicep/azureappservice:v1' = {
  name: 'appservice'
  params: {
    location: location
    tags: tags
    appInsightsComponentsOutput: appInsights
    appServicePlanName: appServicePlanName
    capacity: capacity
    skuName: skuName
    webAppName: webAppName
  }
  dependsOn: [
    appInsights
  ]
}

// Use SQL module from Azure Container Registry
module sql_module 'br:mskacrregistryuksdev.azurecr.io/bicep/azuresqldatabase:v1' = {
  name: 'sql'
  params: {
    location: location
    tags: tags
    collation: collation
    maxSizeBytes: maxSizeBytes
    sqlDatabaseName: sqlDatabaseName
    sqlServerName: sqlServerName
    sqlAdminLogin: sqlAdminLogin
    sqlAdminPassword: sqlAdminPassword
  }
}

output appServicePlanId string = appservice_module.outputs.appServicePlanId


// Use Storage module from Azure Container Registry
module storageaccount_module 'br:mskacrregistryuksdev.azurecr.io/bicep/azurestorageaccount:v1' = {
  name: 'storage'
  params: {
    storageAccountName: storageAccountName
    location: location
    tags: tags
    skuName: storageAccountSkuName
    
  }
}
