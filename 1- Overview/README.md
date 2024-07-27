#Terminal Commands

- To Check Az cli version: az version
- To install Bicep cli: az bicep install
- To upgrade bicep: az bicep upgrade
- To Build and generate the arm template: az bicep build -f 1.Main.bicep
- To Login: az login
- To Logout: az logout
- To Account Clear: az account clear
- Get the list of subscription for logged in account: az account list
- To select particular subscription: az account set --subscription subscription-id
- To Change folde path: Set-Location -Path "directory path"
- To deploy a template file: az deployment group create --resource-group resource-group-name --template-file template-file-name.extension
- To deploy a resource group creation: az deployment sub create --location location --template-file template-file-name.extension
-


# Note (group, sub) is scopes where you want to deploy the resources. The scope for resource group is always subscription level and the other resource deployed inside the resource group

# Short forms
- **-g**: used for --resource-group
- **-f**: used for --template-file
- **-l**: used for --location



# Useful - Links
- https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-interactively#sign-in-with-web-account-manager-wam-on-windows
- 