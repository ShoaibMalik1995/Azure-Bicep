# Azure Bicep - Learn How to Preview changes before bicep exectuion

In Bicep it's possible to preview the changes before we execute the Bicep script. So Bicep give us a confirmation along with all the changes and when we say 'Yes' then it will only execute the bicep script. To say 'No' then it won't run the bicep script.

## This can be achieve with a function called '**What-If**'

We were using the command to deploy the bicep script, which took two parameter to deploy the script:
- Resource Group (-g or --resource-group)
- Template file (-f or --template-file)

Command: az deployment group create -g <rg Name> -f <templatefile Name.bicep>

Now we can add a new parameter **--confirm-with-what-if** with this Bicep ask a confirmation 'Yes' or 'No' inputs along with this, it will also show us the changes that there are going to be created in Azure.

Command: az deployment -g <rg Name> -f Main.bicep --confirm-with-what-if
OR
Command: az deployment -g <rg Name> -f Main.bicep -c

Use the sample script and run the command from the folder:

az deployment group create -g <rg Name> -f <template file name> --confirm-with-what-if
or
az deployment group create -g <rg Name> -f <template file name> -c

# Type of changes that 'What-If' can provides

- **Create**: Create the resources that are defined in the Bicep File (+)
- **Modify**: Modifies the resource properties that are defined the the Bicep File (~)
- **NoChange**: No Changes to the resources as there is no change in the Bicep File (=)
- **Ignore**: Ignore the resources which are created by the other means (*)

