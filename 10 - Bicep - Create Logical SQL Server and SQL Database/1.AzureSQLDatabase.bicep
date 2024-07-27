param location string = resourceGroup().location
param maxSizeBytes string  = '0'
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param sqlServerName string = 'msk-sqlserver-uks-dev'
param sqlDatabaseName string = 'msk-sqldatabase-uks-dev'

// Create a SQL Server
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: 'mskadmin'
    administratorLoginPassword: 'Password1234!'
  }
  dependsOn: []
}

// Create a SQL Database
resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: sqlDatabaseName
  location: location
  properties: {
    collation: collation
    edition: 'Basic'
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: 'Basic'
  }
}
