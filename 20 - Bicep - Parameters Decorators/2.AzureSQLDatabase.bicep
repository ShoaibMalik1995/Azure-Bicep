
// Here are some examples combining multiple decorators for a comprehensive parameter definition

@description('The location for all resources.')
param location string
@description('The maximum size of the database in bytes.')
param maxSizeBytes string  = '0'

@description('The collation of the database.')
param collation string

@description('The name of the SQL Server.')
param sqlServerName string

@description('The name of the SQL Server.')
param sqlDatabaseName string

@description('The name of the SQL Server.')
@secure()
param adminPassword string

@description('The name of the SQL Server.')
@secure()
param adminUsername string

@description('The location for all resources.')
param tags object

// Create a SQL Server and a SQL Database
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: sqlServerName
  location: location
  tags: tags
  properties: {
    administratorLogin: adminPassword
    administratorLoginPassword: adminUsername
  }
  dependsOn: []
}

// Create a firewall rule to allow the current client IP address to access the SQL Server
resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'MSK IP Address'  
  properties: {
    startIpAddress: '86.20.132.31'
    endIpAddress: '86.20.132.31'
  }
}

// Create a SQL Database
resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: sqlDatabaseName
  location: location
  tags: tags
  properties: {
    collation: collation
    edition: 'Basic'
    maxSizeBytes: maxSizeBytes
    requestedServiceObjectiveName: 'Basic'
  }
}

