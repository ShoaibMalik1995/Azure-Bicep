
// Module 1 - To Create App Service Plan, App Service and integrate with Application Insights
module AppServicePlan '../9- Bicep - Integrate Application Insights with App Service using Instrumentation Key/1.AzureAppService.bicep' = {
  name: 'AppServicePlan'
}

// Module 2 - To Create SQL Server and SQL Database
module AzureSQLDatabase '../11 - Bicep - Whitelist IP Address for Azure SQL Database/1.AzureSQLDatabase.bicep' = {
  name: 'AzureSQLDatabase'
} 



