param location string
param appInsightsName string

// Create an Application Insights resource
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output appInsightsResourceId string = appInsightsComponents.id
output appInsightsInstrumentationKey string = appInsightsComponents.properties.InstrumentationKey
