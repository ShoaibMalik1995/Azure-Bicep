
param appServicePlanName string
param aspSkuName string
param aspSkuCapacity int
param location string
param tags object


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  kind: 'linux'
  properties: {
    reserved: true // Set to true for Linux appservice plan
  }
  sku: {
    name: aspSkuName
    capacity: aspSkuCapacity
  }
}

output appServicePlanId string = appServicePlan.id
