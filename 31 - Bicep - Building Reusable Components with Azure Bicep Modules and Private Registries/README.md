# Azure Bicep - Deploy Bicep Modules to Container Registry
## Building Reusable Components with #Azure #Bicep Modules and Private Registries

## Overview
This section explains how to containerize Bicep modules.

## Business Scenario
Imagine we are working as a team in Business Unit 1. To provision infrastructure using Bicep, one of the best practices is to use Bicep modules.

Refer to the Business Unit 1 image. We have three different Bicep modules:

1. Azure App Service
2. Azure Storage Account
3. Azure Database

These three modules were created because the request was to provision these Azure resources. These modules are invoked from the Main.bicep file of Business Unit 1. Once these modules are developed, they can be used to deploy the resources.

Let's say there is a separate Business Unit 2 in the same organization, which has its own platform team of engineers responsible for building Bicep modules. They also follow best practices and have created their own Bicep modules. However, this results in duplicate work as the platform engineers in both business units are working in silos and not reusing each other's work. This duplication of effort is inefficient.

The ideal approach is to have a single set of common Bicep modules that can support all business units. Instead of having two different copies of Bicep modules, we should have one copy that is reusable across all business units.

In the next image, you see two business units, but there could be many more within the organization. We need an architecture where the Bicep modules are common and reusable across all business units. This is the recommended approach for building reusable components for various business units within the organization.

This can be achieved by deploying all the reusable common Bicep modules into a private registry. Azure provides a service called Azure Container Registry, which can be used to host these common Bicep modules. All business units can then invoke these modules by passing their own parameters.

For example, Business Unit 1 has its own Main.bicep file, and Business Unit 2 has its own Main.bicep file, both of which invoke the required Bicep modules. With this setup, we have a single set of Bicep modules deployed in the container registry, making them reusable across the organization.

Now, let's understand the architecture of the container registry (Image).
As you see in the image, we just need to start with creating a container registry and container registry has components starting with repositories so in general container registry host containers basically Docker containers and now they support hosting bicep modules as well as you can see here bicep module is also a repository don't get confused with git repositories. the terminology is same but they serve different purpose so here you can see the bicep modules contains multiple parts app service, storage and database. These are three different modules that we can deploy into bicep modules repository and each repo can contain multiple versions as you can see app service has two versions V1 & V2 right. 

Advantage:
So Now when you follow this private registry architecture the main advantage that you get is you can keep adding versions for your bicep code so maintaining versions will provide backward compatibility to the business units where they get a flexibility of picking the appropriate versions.

For Example: Currently in the image Business Unit 3, we have seen two business units. The first business unit might have different requirements and the second business units might have different requirements for the same app service. 

In order to be flexiable in supporting different requirements for business to business units we can have different versions of the code in the bicep module and deploy them as two different versions that way different requirements can be achieved with the help of this versioning.



### Note: This section explain, how to containerize the bicep modules or files using docker container

