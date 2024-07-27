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

resource AppInsights 'Microsoft.Insights/components@2020-02-02' existing = {
  name: appInsightsName
}


// Module 1 - To Create App Service Plan, and App Service
module AppServicePlan '2.AzureAppService.bicep' = {
  name: 'AppServicePlan'
  params: {
    location: location
    skuName: skuName
    capacity: capacity
    appServicePlanName: appServicePlanName
    webAppName: webAppName
    tags: tags
    AppInsightsInstrumentationKey: AppInsights.properties.InstrumentationKey
    AppInsightsConnectionString: AppInsights.properties.ConnectionString
  }
  dependsOn: [
    AppInsights
  ]
}


