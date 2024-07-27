param resourceGroupNames array = [
  'lgp-bicepdemo-001-uks-rg'
  'lgp-bicepdemo-002-uks-rg'
  'lgp-bicepdemo-003-uks-rg'
]

param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

targetScope = 'subscription'

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = [for resourceGroupName in resourceGroupNames: {
  name: resourceGroupName
  location: 'uksouth'
  tags: tags
}]
