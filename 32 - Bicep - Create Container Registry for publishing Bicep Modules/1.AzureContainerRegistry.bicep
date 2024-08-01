param location string = resourceGroup().location
@description('Name of the container registry does not contain any special characters or spaces or capital letters and must be unique within the subscription.')
param acrName string = 'mskacrregistryuksdev' 
param acrSku string = 'Basic'

resource azureContainerRegistry 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: acrSku
  }
  properties: {
    adminUserEnabled: true
  }
}

// Output the login server URL
output acrLoginServer string = azureContainerRegistry.properties.loginServer
