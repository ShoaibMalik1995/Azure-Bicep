param location string = resourceGroup().location
param storageAccountName string
param storageAccountskuName string
param tags object

// Module - 1 To Create Storage Account
module StorageAccount '2.StorageAccount.bicep' = {
  name: 'StorageAccount'
  params: {
    location: location
    storageAccountName: storageAccountName
    skuName: storageAccountskuName
    tags: tags
  }
}

