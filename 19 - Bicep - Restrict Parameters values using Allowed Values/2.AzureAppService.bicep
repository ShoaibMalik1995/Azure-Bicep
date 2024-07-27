param location string
@description('''Please provide the SKU name for the App Service Plan. Allowed values are 
- F1
- B1
- B2
- B3
- S1
- S2
- S3
''')
@allowed(
  [
    'F1', 'B1', 'B2', 'B3', 'S1', 'S2', 'S3'
  ])
param skuName string
param capacity int
param appServicePlanName string
param webAppName string
param tags object
param AppInsightsInstrumentationKey string
@secure()
param AppInsightsConnectionString string


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
        value: AppInsightsInstrumentationKey
      }
      {  
        name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
        value: AppInsightsConnectionString
      
      }
    ]
  }
}


// Output the App Service Plan ID
output appServicePlanId string = appServicePlan.id
