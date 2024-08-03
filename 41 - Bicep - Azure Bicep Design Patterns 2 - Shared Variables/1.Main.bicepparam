using './1.Main.bicep'

param environment = 'Development'
param envShort = 'dev'

var prefix = loadJsonContent('sharedvariables.json')

param appServicePlanName = '${prefix.projectprefix}-appserviceplan-${prefix.appserviceplanprefix}-uks-${envShort}'
param webAppName = '${prefix.projectprefix}-webapp-uks-${prefix.appserviceprefix}-${envShort}'
param appInsightsName = '${prefix.projectprefix}-appinsights-${prefix.appinsightsprefix}-uks-${envShort}'
param sqlServerName = '${prefix.projectprefix}-sqlserver-uks-${envShort}'
param sqlDatabaseName = '${prefix.projectprefix}-sqldatabase-uks-${envShort}'
param tags = {
  environmentid: envShort
  environmentType: '${prefix.projectprefix}-${envShort}'
  costCenter: 'AIS'
}
param deployAppService = true
param deploySQLDatabase = true
param deployAppInsights = true

