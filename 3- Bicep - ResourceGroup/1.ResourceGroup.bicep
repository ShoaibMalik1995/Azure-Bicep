
targetScope = 'subscription'

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'lgp-bicepdemo-uks-rg'
  location: 'uksouth'
}
