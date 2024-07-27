param location string = resourceGroup().location
param tags object
param maxSizeBytes string
param collation string
param sqlServerName string
param sqlDatabaseName string
param keyVaultName string

// Existing Resource - To Refer Key Vault for Secrets
resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: keyVaultName
}

// Module 1 - To Create SQL Server and SQL Database
module AzureSQLDatabase '2.AzureSQLDatabase.bicep' = {
  name: 'AzureSQLDatabase'
  params:{
    location: location
    tags: tags
    sqlAdminLogin: keyVault.getSecret('sqlAdminLogin')
    sqlAdminPassword: keyVault.getSecret('sqlAdminPassword')
    collation: collation
    maxSizeBytes: maxSizeBytes
    sqlDatabaseName: sqlDatabaseName
    sqlServerName: sqlServerName
  }
}

