param location string = resourceGroup().location
param maxSizeBytes string  = '0'
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param sqlServerName string = 'msk-sqlserver-uks-dev'
param sqlDatabaseName string = 'msk-sqldatabase-uks-dev'

param tags object = {
  environmentid: 'dev'
  environmentType: 'msk-dev'
  costCenter: 'AIS'
}

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
