param location string
param appInsightsName string
param tags object

// Create an Application Insights resource
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  tags: tags
  properties: {
    Application_Type: 'web'
  }
}

output appInsightsComponentsOutput object = appInsightsComponents
