param location string = resourceGroup().location
param keyVaultName string = 'msk-keyvault-uks-dev' 
param accesspolicies array = [
  {
    objectId: 'a0a0a0a0-a0a0-a0a0-a0a0-a0a0a0a0a0a'
  }
  {
    objectId: 'b0b0a0a0-a0a0-a0a0-a0a0-b0a0a0a0a0a'
  }
  {
    objectId: 'c0c0a0a0-a0a0-a0a0-c0a0-a0a0a0a0c0c'
  }
]

// Create a Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: subscription().tenantId
    accessPolicies: []
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
}

// Create multiple access policies in the Key Vault
resource accessPolicies 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add' // Allowed values: 'add', 'replace', 'remove'
  properties: {    
    accessPolicies: [for accesspolicy in accesspolicies: {
      tenantId: subscription().tenantId
      objectId: accesspolicy.objectId // Object ID of the user or service principal
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
