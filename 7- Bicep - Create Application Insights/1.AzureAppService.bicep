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

// Create an App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  kind: 'windows'
  tags: tags
  properties: {
    reserved: false
    targetWorkerCount: 1
    targetWorkerSizeId: 0
  }
  sku: {
    name: skuName
    capacity: capacity
  }
}

// Create a web app
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: webAppName
  location: location
  tags: tags
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', appServicePlanName)
    // serverFarmId: appServicePlan.id
  }
  dependsOn: [
    appServicePlan
  ]
}


// Create an Application Insights resource
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}


// Output the App Service Plan ID
output appServicePlanId string = appServicePlan.id
