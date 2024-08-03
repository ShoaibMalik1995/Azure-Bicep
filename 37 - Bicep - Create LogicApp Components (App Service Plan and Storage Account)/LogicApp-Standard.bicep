param location string = resourceGroup().location
param logicAppName string = 'msk-logicapp-standard-uks-dev'
param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}
param appInsightName string = 'msk-appinsights-uks-dev'
param storageAccountNameLA string = 'mskstorageaccountuksdev'
param fileShareName string = 'mskfileshareuksdev'

param appServicePlanName string = 'msk-asplogicapp-uks-dev'
param appServicePlanSkuName string = 'WS1'
param appServicePlnaCapacity int = 1

// Create the Logic App - Standard
resource LogicApp_Standard 'Microsoft.Web/sites@2023-12-01' = {
  name: logicAppName
  location: location
  tags: tags
  kind: 'functionapp,workflowapp'
  properties: {
    serverFarmId: appServicePlan.outputs.appServicePlanId
    siteConfig: {
      netFrameworkVersion: 'v4.0'
      functionsRuntimeScaleMonitoringEnabled: false
      appSettings: [ ]
    }
  }
}

// Use Existing Storage Account to get the Storage Account Key
resource storageAccount2 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
  name: storageAccountNameLA
  scope: resourceGroup(location)
}

// Create the AppSettings for the Logic App
resource appSettings 'Microsoft.Web/sites/config@2023-12-01' = {  
  name: 'appsettings'
  parent: LogicApp_Standard
  properties: {
    App_Kind: 'workflowsapp'
    FUNCTIONS_EXTENSION_VERSION: '~4'
    FUNCTIONS_WORKER_RUNTIME: 'node'
    APPINSIGHTS_INSTRUMENTATIONKEY: AppInsights.outputs.appInsightsInstrumentationKey
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.outputs.storageAccountName};AccountKey=${storageAccount2.listKeys().keys[0].value};EndpointSuffix=core.windows.net'
    WEBSITE_CONTENTSHARE: fileShareName
    AzureWebJobsStorage: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.outputs.storageAccountName};AccountKey=${storageAccount2.listKeys().keys[0].value};EndpointSuffix=core.windows.net'
    AzureWebJobsSecretStorageType: 'Files'

  }
  dependsOn: [
    AppInsights
    storageAccount
  ]
}

// Include the AppInsights module
module AppInsights './AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    location: location
    appInsightsName: appInsightName
    tags: tags
  }
}

// Include the StorageAccount module
module storageAccount './StorageAccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    storageAccountName: storageAccountNameLA
    fileShareName: fileShareName
    storageAccountSkuName: 'Standard_LRS'
    tags: tags
  }
}

// Include the AppServicePlan module
module appServicePlan './AppServicePlan.bicep' = {
  name: 'appServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    appServicePlnaCapacity: appServicePlnaCapacity
    tags: tags
  }
} 
