using './1.Main.bicep'

param environment = 'Development'
param envShort = 'dev'
param appServicePlanName = 'msk-appserviceplan-uks-${envShort}'
param webAppName = 'msk-webapp-uks-${envShort}'
param appInsightsName = 'msk-appinsights-uks-${envShort}'
param sqlServerName = 'msk-sqlserver-uks-${envShort}'
param sqlDatabaseName = 'msk-sqldatabase-uks-${envShort}'
param tags = {
  environmentid: envShort
  environmentType: 'msk-${envShort}'
  costCenter: 'AIS'
}
param deployAppService = true
param deploySQLDatabase = true
param deployAppInsights = true

