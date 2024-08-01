# Azure Bicep - Publish Azure Bicep Modules to Azure Container Private Registry

## Overview
This guide provides instructions for creating an Azure Container Registry (ACR) to publish and manage Azure Bicep modules. Using ACR allows you to store and share Bicep modules across different projects and teams within your organization, promoting reusability and collaboration.

# Examples - Commands

- **Publish a bicep file**
        az bicep publish --file {bicep_file} --target "br:{registry}/{module_path}:{tag}"

   e.g: az bicep publish --file 1.AzureAppService.bicep --target "br:azcruksdevacr1.azurecr.io/bicep/appserviceplan:v1"

- **Publish a bicep file with documentation uri**
        az bicep publish --file {bicep_file} --target "br:{registry}/{module_path}:{tag}"
        --documentation-uri {documentation_uri}

- **Publish a bicep file with documentation uri and include source code**
        az bicep publish --file {bicep_file} --target "br:{registry}/{module_path}:{tag}"
        --documentation-uri {documentation_uri} --with-source
