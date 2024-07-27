param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

param maxSizeBytes string  = '0'
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param sqlServerName string = 'msk-sqlserver-uks-dev'
param sqlDatabaseName string = 'msk-sqldatabase-uks-dev'
param keyVaultName string = 'msk-keyvault-uks-dev'

// Module 1 - Use Existing KeyVault
resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: keyVaultName
}

// Module 2 - To Create SQL Server and SQL Database
module AzureSQLDatabase '2.AzureSQLDatabase.bicep' = {
  name: 'AzureSQLDatabase'
  params: {
    location: resourceGroup().location
    maxSizeBytes: maxSizeBytes
    collation: collation
    sqlServerName: sqlServerName
    sqlDatabaseName: sqlDatabaseName
    tags: tags
    adminPassword: keyVault.getSecret('adminPassword')
    adminUsername: keyVault.getSecret('adminUsername')
  }
} 


