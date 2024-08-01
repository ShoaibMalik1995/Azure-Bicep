# Azure Function App - Configure Application Insights Using Reference Function
This section explains how we can use the reference function to dynamically retrieve the instrumentation key for Application Insights within our Bicep template.

## Overview
The reference function allows us to access properties of a deployed resource dynamically. By using this function, we can avoid hardcoding sensitive information like instrumentation keys and instead retrieve them directly from the resource.

## Parameters of the Reference Function
The reference function accepts the following parameters:

- **resourceId (string)**: The unique identifier of the resource you want to reference.
- **apiVersion (string) (optional)**: The API version of the resource you are referencing. This is optional if the resource's API version is not required to resolve the reference.
- **Full (boolean) (optional)**: A boolean flag indicating whether to retrieve the full resource object, including all nested resources and their properties. By default, it retrieves only the top-level properties.

## Example Usage
Below is an example of how to use the reference function to get the Application Insights instrumentation key and configure it in an Azure Function App.

### Parameters
```bicep
param functionAppName string
param appInsightsName string
param resourceGroupName string
```

### Resources
```bicep
resource appInsights 'Microsoft.Insights/components@2015-05-01' existing = {
  name: appInsightsName
  scope: resourceGroup(resourceGroupName)
}

resource functionApp 'Microsoft.Web/sites@2021-02-01' existing = {
  name: functionAppName
  scope: resourceGroup(resourceGroupName)
}

resource appSettings 'Microsoft.Web/sites/config@2021-02-01' = {
  name: '${functionAppName}/appsettings'
  properties: {
    "APPINSIGHTS_INSTRUMENTATIONKEY": reference(appInsights.id, '2015-05-01').InstrumentationKey
  }
}
```

## Important Notes
- **Avoid Hardcoding**: Do not hardcode sensitive information directly in your Bicep files. Use the reference function to fetch them dynamically.
- **Security**: Ensure that the appropriate permissions are set to allow your deployment to reference the necessary resources.

## Conclusion
By using the reference function, we can dynamically retrieve and configure the instrumentation key for Application Insights, enhancing the security and maintainability of our Bicep templates. This method can be extended to retrieve other properties from various Azure resources dynamically.


