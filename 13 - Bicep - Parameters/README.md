# Azure Bicep Parameters
This section explains how to pass parameter values from the main Bicep file into modules to deploy resources, instead of hardcoding and defining parameter values inside the file. This approach helps to improve Bicep scripts and enhances reusability, allowing you to use the same script for different similar resource deployments by using a template file and passing parameters.

To pass parameter values from the main Bicep file into modules, follow these steps:

1. Create a template file: Create a separate Bicep file, let's call it `1.Main.bicep`, to define the parameters that you want to pass to the modules.

2. Define parameters: Inside the `1.Main.bicep` file, define the parameters using the `param` keyword. For example:

    ```bicep
    param location string = 'eastus'
    param skuName string = 'S1'
    ```

3. Reference the parameters: In your main Bicep file, reference the parameters by using the `params` keyword followed by the path to the `2.AzureAppService.bicep` file. For example:

    ```bicep
    module AppServicePlan '2.AzureAppService.bicep' = {
    name: 'AppServicePlan'
    params: {
        location: location
        skuName: skuName
        ...
    }
    }
    ```

    This way, the values of `location` and `skuName` parameters defined in the `1.Main.bicep` file will be passed to the `AppServicePlan` module.

By following this approach, you can easily customize the deployment of resources by modifying the values in the `1.Main.bicep` file, without modifying the main Bicep file. This enhances reusability and makes your Bicep scripts more flexible.

For more information on using parameters in Bicep, refer to the official documentation.
