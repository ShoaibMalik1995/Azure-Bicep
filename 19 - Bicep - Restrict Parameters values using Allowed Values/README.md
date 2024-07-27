# Azure Bicep - Restrict Parameters values using Allowed Values

## Overview
In Azure Bicep, you can restrict the values that can be assigned to parameters by using the `@allowed` property. This allows you to define a specific set of valid values for a parameter.

To restrict parameter values using allowed values, follow these steps:

1. Open the Bicep file where you have defined your parameters.
2. Locate the parameter that you want to restrict the values for.
3. Add the `@allowed` property to the parameter and specify the valid values as an array (`2.AzureAppservice.bicep`).

Here's an example of how to restrict the values for a parameter named `skuName` to only allow "dev", "test", and "prod":

```bicep
@allowed(
  [
    'F1', 'B1', 'B2', 'B3', 'S1', 'S2', 'S3'
  ])
param skuName string
```

By specifying the `@allowed` property, any other value assigned to the `skuName` parameter will result in a validation error during deployment.
