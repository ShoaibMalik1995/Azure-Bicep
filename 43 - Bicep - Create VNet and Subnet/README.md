# Azure Bicep - Create VNet and Subnet

## Overview
This guide provides instructions on how to use Azure Bicep to create a Virtual Network (VNet) and Subnet in Azure. It simplifies the authoring experience with more concise syntax and better support for modularity and reuse compared to traditional ARM templates.

In Azure, a Virtual Network (VNet) is the fundamental building block for private networks. VNets enable Azure resources, such as virtual machines (VMs), to securely communicate with each other, the internet, and on-premises networks. Subnets are subdivisions of a VNet and allow you to segment your network to organize and secure your resources.

## Virtual Network (VNet)
A VNet is a logically isolated network on Azure. It provides the following benefits:

- Isolation and Segmentation: VNets are isolated from one another, allowing for segmentation of networks.
- Communication: VNets enable Azure resources to communicate with each other, the internet, and on-premises networks.
- Customization: You can customize the IP address range, subnets, and security settings.
- Scalability: VNets can be scaled up or down according to the needs of your applications.

## Subnet
A subnet is a range of IP addresses in a VNet. Subnets help organize and secure your resources by segmenting the VNet into smaller, manageable sections. Each subnet contains a subset of the VNet's IP address range.


