param location string
param storageAccountName string
param storageAccountSkuName string
param tags object

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  tags: tags
  sku: {
    name: storageAccountSkuName
  }
}

output storageAccountId string = storageaccount.id
output storageAccountName string = storageaccount.name
