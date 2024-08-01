# Azure Function App Configure Storage keys using ListKeys
This section is an enhancement from the last session and explains how we can change the static, hard-coded Storage Account connectionstring to dynamically read the values using the listKeys function in the Bicep file. In the next session, I will explain how we can change and get the Application Insights instrumentation keys dynamically.

## Important Notes
- Ensure that you do not hard-code sensitive information such as connection strings directly in your Bicep files.
- Use Key Vault to store and manage sensitive information securely.
- This example demonstrates using listKeys function which is a way to dynamically retrieve keys. It is recommended to manage and rotate your keys periodically for security reasons.

## Note: _TO_BE_REPLACED_
In the Azure Function App Bicep file, replace the TO_BE_REPLACED placeholders with the actual values from the Azure portal to test the deployment. Make sure you don't check in the instrumentation key values to your repository. In the next section, I will show you how to read these values dynamically.