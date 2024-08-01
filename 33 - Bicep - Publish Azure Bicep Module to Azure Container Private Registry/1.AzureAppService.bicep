param location string
param skuName string
param capacity int
param appServicePlanName string
param webAppName string
param tags object
param appInsightsComponentsOutput object

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

// Create Web App Settings
resource webAppSettings 'Microsoft.Web/sites/config@2021-01-15' = {
  name: 'web'
  parent: webApplication
  properties: {
    alwaysOn: true
    appSettings: [
      {  
        name: 'Website_Node_DefaultVersion'
        value: '14.17.0'
      }
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appInsightsComponentsOutput.properties.InstrumentationKey
      }
      {  
        name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
        value: appInsightsComponentsOutput.properties.ConnectionString
      
      }
    ]
  }
}


// Output the App Service Plan ID
output appServicePlanId string = appServicePlan.id
