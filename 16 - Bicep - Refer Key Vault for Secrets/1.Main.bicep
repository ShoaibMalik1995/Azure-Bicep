param location string = resourceGroup().location
param tags object
param maxSizeBytes string
param collation string
param sqlServerName string
param sqlDatabaseName string

param sqlAdminLogin string
@secure()
param sqlAdminPassword string

// Module 1 - To Create SQL Server and SQL Database
module AzureSQLDatabase '2.AzureSQLDatabase.bicep' = {
  name: 'AzureSQLDatabase'
  params:{
    location: location
    tags: tags
    sqlAdminLogin: sqlAdminLogin
    sqlAdminPassword: sqlAdminPassword
    collation: collation
    maxSizeBytes: maxSizeBytes
    sqlDatabaseName: sqlDatabaseName
    sqlServerName: sqlServerName
  }
}

