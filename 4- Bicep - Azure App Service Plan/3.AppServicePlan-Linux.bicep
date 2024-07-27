param location string = resourceGroup().location
param appServicePlans array = [
  {
    name: 'msk-linux-asp-001-uks-dev'  
    skuName: 'S1'
    skuCapacity: 1
  }
]

param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = [for asp in appServicePlans: {
  name: asp.name
  location: location
  tags: tags
  kind: 'linux'
  properties: {
    reserved: true // Set to true for Linux appservice plan
  }
  sku: {
    name: asp.skuName
    capacity: asp.skuCapacity
  }
}
]
