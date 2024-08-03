param location string
param appInsightsName string
param tags object

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  tags: tags
  properties: {
    Application_Type: 'web'
  }
}

output appInsightsId string = appInsightsComponents.id
output appInsightsInstrumentationKey string = appInsightsComponents.properties.InstrumentationKey
output appInsightsName string = appInsightsComponents.name
