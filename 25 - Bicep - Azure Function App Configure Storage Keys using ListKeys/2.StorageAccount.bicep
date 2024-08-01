@description('Location for all resources')
param location string
@description('Create a Storage Account')
param storageAccountName string
@description('SKU Name for the Storage Account')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param skuName string
@description('Tags for the Storage Account')
param tags object

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  tags: tags
  sku: {
    name: skuName
  }
}

output storageAccountId string = storageaccount.id
output storageAccountName string = storageaccount.name
output storageAccountConnectionString string = storageaccount.properties.primaryEndpoints.blob
