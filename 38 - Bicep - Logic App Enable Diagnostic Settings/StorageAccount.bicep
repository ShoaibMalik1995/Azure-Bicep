param location string
param storageAccountName string
param storageAccountSkuName string
param fileShareName string
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

resource fileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-06-01' = {
  name: '${storageAccountName}/default/${fileShareName}'
  properties: {
    enabledProtocols: 'SMB'
  }
}

output storageAccountId string = storageaccount.id
output storageAccountName string = storageaccount.name
