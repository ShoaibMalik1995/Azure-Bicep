# Azure Bicep Parameters Decorators

## Overview
Azure Bicep is a domain-specific language (DSL) for deploying Azure resources declaratively. Parameters in Bicep allow for the customization and reuse of templates. Decorators in Bicep provide additional context and constraints for parameters, making your templates more robust and easier to understand.

## Syntax
Decorators in Bicep are prefixed with the `@` symbol and are placed directly above the parameter definition

## Common Decorators
- **@description**: The @description decorator adds a description to a parameter.
```bicep
@description('The name of the storage account.')
param storageAccountName string

// Use to write a multi-line description with bullet points:
@description('''Please provide the SKU name for the App Service Plan. Allowed values are 
- F1
- B1
- B2
- B3
- S1
- S2
- S3
''')
@allowed(
  [
    'F1', 'B1', 'B2', 'B3', 'S1', 'S2', 'S3'
  ])
param skuName string
```
- **@minLength**: The @minLength decorator specifies the minimum length for a string parameter.
```bicep
@minLength(3)
param storageAccountName string
```

- **@maxLength**: The @maxLength decorator specifies the maximum length for a string parameter.
```bicep
@maxLength(24)
param storageAccountName string
```

- **@minValue**: The @minValue decorator specifies the minimum value for a numeric parameter.
```bicep
@minValue(1)
param instanceCount int
```

- **@maxValue**: The @maxValue decorator specifies the maximum value for a numeric parameter.
```bicep
@maxValue(10)
param instanceCount int
```

- **@allowed**: The @allowed decorator specifies a set of allowed values for a parameter.
```bicep
@allowed(['Standard_LRS', 'Standard_GRS', 'Standard_RAGRS'])
param sku string
```

- **@secure**: The @secure decorator marks a parameter as secure, ensuring its value is not exposed in logs.
```bicep
@secure()
param adminPassword string
```


