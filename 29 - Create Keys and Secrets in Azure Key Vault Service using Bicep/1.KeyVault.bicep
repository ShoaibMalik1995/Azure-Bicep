param location string = resourceGroup().location
param keyVaultName string = 'msk-keyvault-uks-dev'
param objectId string = 'a0a0a0a0-a0a0-a0a0-a0a0-a0a0a0a0a0a' // Object ID of the user or service principal

// Create a Key Vault
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

// Create a key in the Key Vault
resource keyVaultKey 'Microsoft.KeyVault/vaults/keys@2023-07-01' = {
  parent: keyVault
  name: 'msk-key'
  properties: {
    keySize: 2048
    kty: 'RSA'
    curveName: 'P-256'
    keyOps: [
      'encrypt'
      'decrypt'
      'sign'
      'verify'
    ]
  }
}

// Create a secret in the Key Vault
resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
  parent: keyVault
  name: 'msk-secret'
  properties: {
    value: 'MySecret'
  }
}
