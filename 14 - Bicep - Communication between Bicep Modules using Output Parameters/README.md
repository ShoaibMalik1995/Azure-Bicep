# Bicep Communication between Bicep Modules using Output Parameters

## Overview

This project demonstrates how to enable communication between Bicep modules using output parameters. Bicep is a domain-specific language (DSL) for deploying Azure resources declaratively. By leveraging output parameters, you can pass information from one module to another, facilitating modular and reusable infrastructure as code.

## Key Concepts

- **Bicep Modules**: Reusable components that encapsulate a set of related resources.
- **Output Parameters**: Values that a Bicep module can return after deployment, which can be used by other modules or the main Bicep file.

## Structure

The project is structured as follows:

- **1.Main.bicep**: The main Bicep file that orchestrates the deployment and handles the communication between modules.
- **2.AzureAppService.bicep**: A Bicep module that defines a set of resources App Service Plan, App Service (Web App) and Consumes the output parameters from `4.AppInsights.bicep`.
- **3.AzureSQLDatabase.bicep**: A Bicep module that defines a set of resources SQL Server, SQL Database, and SQL Database Firewall rules.
- **4.AppInsights.bicep**: A Bicep module that defines resource Application Insights.

## Usage

1. **Define Output Parameters**: In `4.AppInsights.bicep`, define the resources and specify the output parameters.
    ```bicep
    output appInsightsComponentsOutput object = appInsightsComponents
    ```

2. **Consume Output Parameters**: In `1.Main.bicep`, reference the output parameters from `4.AppInsights.bicep` and pass them to `2.AzureAppService.bicep`.
    ```bicep
    module AppInsights '4.AppInsights.bicep' = {
      name: 'AppInsights'
      ...
    }

    module AppServicePlan '2.AzureAppService.bicep' = {
      name: 'AppServicePlan'
      params: {
        appInsightsComponentsOutput: AppInsights.outputs.appInsightsComponentsOutput
        ...
      }
    }
    ```

## Prerequisites

- Azure CLI
- Bicep CLI

## Deployment

To deploy the Bicep files, use the following Azure CLI command:

```sh
az deployment group create --resource-group <resource-group-name> --template-file 1.Main.bicep
or
az deployment group create -g <resource-group-name> -f 1.Main.bicep