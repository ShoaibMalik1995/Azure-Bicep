# Azure Bicep - Run Bicep Script in Multiple Environments Using Parameters
# Multiple Environment Infrastructure Provisioning with Bicep Script

This repository contains a Bicep script that allows you to provision infrastructure in multiple environments. The script is designed to be flexible and customizable, making it easy to deploy resources in different environments with minimal effort.

## Features
- **Environment-specific parameters**: The Bicep script utilizes parameters to define environment-specific settings such as resource names, locations, and configurations. This allows you to easily provision resources in different environments without modifying the script itself.
- **Reusable modules**: The script leverages Bicep modules to encapsulate common resource configurations. This promotes code reusability and simplifies the provisioning process.
- **Infrastructure as Code**: By using Bicep, you can define your infrastructure as code, making it version-controlled, repeatable, and easily auditable.

## Getting Started
To get started with provisioning infrastructure using this Bicep script, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the folder.
3. create a `...parameters.<environment>.json` file and specify the environment-specific parameter values.
4. Return to the root folder of the repository.
5. Open a terminal or command prompt and run the following command to deploy the infrastructure:

```bash
az deployment group create -g <resourceGroupName> -f 1.Main.json -p 1.Main.parameters.<environment>.json
```

Replace `<resourceGroupName>` with the Resource Group Name and `<environment>` with the name of the environment you created in step 3.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
