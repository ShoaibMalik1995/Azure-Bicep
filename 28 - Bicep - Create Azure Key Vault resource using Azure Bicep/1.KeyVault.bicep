param location string = resourceGroup().location
param keyVaultName string = 'msk-keyvault-uks-dev'
param objectId string = 'a0a0a0a0-a0a0-a0a0-a0a0-a0a0a0a0a0a' // Object ID of the user or service principal

resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: objectId
        permissions: {
          keys: [
            'list'
            'get'
            'set'
          ]
          secrets: [
            'list'
            'get'
            'set'
          ]
        }
      }
    ]
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
}
