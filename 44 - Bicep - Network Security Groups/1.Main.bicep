param location string = resourceGroup().location
param networkSecurityGroupName string
param securityRules array
resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: securityRules
  }
}
