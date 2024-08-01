
param location string
param functionAppName string 
param serverfarmsId string
param tags object

resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  tags: tags
  properties: {
    serverFarmId: serverfarmsId    
    siteConfig: {
      netFrameworkVersion: 'v6.0'
      appSettings: [
        {
          name: 'AzureWebJobsDashboard'
          value: '_TO_BE_REPLACED_'
          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName1;AccountKey=${listKeys('storageAccountID1', '2019-06-01').key1}'
        }
        {
          name: 'AzureWebJobsStorage'
          value: '_TO_BE_REPLACED_'
          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName2;AccountKey=${listKeys('storageAccountID2', '2019-06-01').key1}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: '_TO_BE_REPLACED_'
          // value: 'DefaultEndpointsProtocol=https;AccountName=storageAccountName3;AccountKey=${listKeys('storageAccountID3', '2019-06-01').key1}'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(functionAppName)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: '_TO_BE_REPLACED_'
          //value: reference('insightsComponents.id', '2015-05-01').InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
      ]
    }
  }
}
