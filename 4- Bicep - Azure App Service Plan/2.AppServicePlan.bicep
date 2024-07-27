param location string = resourceGroup().location
param appServicePlans array = [
  {
    name: 'msk-asp-001-uks-dev'  
    skuName: 'S1'
    skuCapacity: 1
  }
  {  
    name: 'msk-asp-002-uks-dev'  
    skuName: 'S1'
    skuCapacity: 1
  }
  {  
    name: 'msk-asp-003-uks-dev'  
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
  kind: 'windows' // By default, the kind is set to windows
  properties: {
    reserved: false // By default, reserved is set to false
  }
  sku: {
    name: asp.skuName
    capacity: asp.skuCapacity
  }
}
]
