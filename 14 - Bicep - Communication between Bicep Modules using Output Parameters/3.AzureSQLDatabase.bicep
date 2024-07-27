param location string
param maxSizeBytes string
param collation string
param sqlServerName string
param sqlDatabaseName string
param tags object

// Create a SQL Server and a SQL Database
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: sqlServerName
  location: location
  tags: tags
  properties: {
    administratorLogin: 'mskadmin'
    administratorLoginPassword: 'Password1234!'
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
