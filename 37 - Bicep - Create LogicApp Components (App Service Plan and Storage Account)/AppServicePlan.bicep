param location string
param appServicePlanName string
param appServicePlanSkuName string
param appServicePlnaCapacity int
param tags object

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  sku: {
    name: appServicePlanSkuName
    capacity: appServicePlnaCapacity
  }
  properties: {
    reserved: false
  }
}

output appServicePlanId string = appServicePlan.id
