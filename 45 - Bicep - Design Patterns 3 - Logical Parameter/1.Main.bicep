param location string = resourceGroup().location
param networkSecurityGroupName string
param environment string

var securityRules  = [
  {
    name: 'Allow-8080'
    properties: {
      description: 'Allow inbound traffic on port 8080'
      sourceAddressPrefix: 'Internet'
      sourcePortRange: '*'          
      destinationAddressPrefix: '*'
      destinationPortRange: '*'
      protocol: 'Tcp'
      access: 'Allow'          
      direction: 'Inbound'
      priority: 100
    }
  }
]

var securityRules_Dev  = [
  {
    name: 'Allow-3389'
    properties: {
      description: 'Allow inbound traffic on port 3389'
      sourceAddressPrefix: 'Internet'
      sourcePortRange: '3389'          
      destinationAddressPrefix: '*'
      destinationPortRange: '3389'
      protocol: 'Tcp'
      access: 'Allow'          
      direction: 'Inbound'
      priority: 200
    }
  }
]
var finalSecurityRules = (environment == 'dev') ? concat(securityRules, securityRules_Dev) : securityRules


resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: finalSecurityRules
  }
}
