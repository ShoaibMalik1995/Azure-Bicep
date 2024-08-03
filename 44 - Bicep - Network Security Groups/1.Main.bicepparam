using './1.Main.bicep'

param networkSecurityGroupName = 'msk-nsg001-uks-dev'
param securityRules = [
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

