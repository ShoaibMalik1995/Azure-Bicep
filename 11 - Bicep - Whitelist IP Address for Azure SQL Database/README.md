# Whitelist IP Address for Azure SQL Database
It's good practice to whitelist the IP address via Bicep code instead of updating it manually on the Azure portal.

## Note: The Bicep script does not override the whitelisted IP rules added manually, which is a good thing