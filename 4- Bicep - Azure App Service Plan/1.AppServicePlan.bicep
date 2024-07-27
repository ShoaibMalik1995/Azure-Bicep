param location string = resourceGroup().location
param name string = 'lgp-appserviceplan-uks-dev'  
param skuName string = 'S1'
param capacity int = 1

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: name
  location: location
  kind: 'windows' // By default, the kind is set to windows
  properties: {
    reserved: false // By default, reserved is set to false
  }
  sku: {
    name: skuName
    capacity: capacity
  }
}
