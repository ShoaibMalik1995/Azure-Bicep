# Azure Bicep - Conditional Expressions & Conditional Deployment

## Overview
Azure Bicep allows you to use conditional expressions to control the deployment of resources based on certain conditions. This can be particularly useful in scenarios where you want to deploy resources only under specific circumstances. This feature enables you to create more flexible and dynamic infrastructure-as-code templates, reducing the need for multiple templates and making your deployments more efficient.

## Syntax
The basic syntax for a conditional expression in Bicep is:
```bicep
condition: <boolean expression>
```
This expression is used within resource or module declarations to control their deployment.

## Examples

### Simple Condition (Conditional Deployment)
Deploy a storage account only if the deployStorage parameter is set to true.
```bicep
param deployStorage bool = false
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = if (deployStorage) {
  name: 'mystorageaccount'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

```

### Condition with Parameters (Conditional Expression)
Use a parameter to determine the SKU of a storage account based on an environment parameter.
```bicep
param environment string
param storageSku string = environment == 'production' ? 'Standard_GRS' : 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'mystorageaccount'
  location: 'eastus'
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}

```

### Nested Conditions (Conditional Deployment)
Use nested conditions to deploy different resources based on multiple parameters.

```bicep
param deployStorage bool
param deployVm bool

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = if (deployStorage) {
  name: 'mystorageaccount'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-03-01' = if (deployVm) {
  name: 'myvm'
  location: 'eastus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    osProfile: {
      computerName: 'myvm'
      adminUsername: 'adminuser'
      adminPassword: 'password'
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
      }
    }
  }
}

```

## Best Practices
- **Use Descriptive Parameter Names**: Ensure parameter names clearly indicate their purpose to make the template easier to understand.
- **Default Values**: Provide default values for parameters where appropriate to simplify template usage.
- **Minimal Conditions**: Use conditional expressions wisely to avoid overcomplicating your template.
- **Consistent Formatting**: Maintain consistent formatting for readability and maintainability.

