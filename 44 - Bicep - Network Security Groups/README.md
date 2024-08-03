# Azure Bicep - Network Security Groups

## Overview
This README file provides guidance on how to use Azure Bicep to create and manage Network Security Groups (NSGs). NSGs are a critical component in securing your Azure network by controlling inbound and outbound traffic to network interfaces (NIC), VMs, and subnets.

## What is a Network Security Group?
A Network Security Group (NSG) is a resource in Azure that contains a list of security rules that allow or deny network traffic to resources connected to Azure Virtual Networks (VNets). NSGs can be associated with subnets or individual network interfaces attached to VMs.

## Key Concepts
- Inbound Security Rules: Define the inbound traffic that is allowed or denied.
- Outbound Security Rules: Define the outbound traffic that is allowed or denied.
- Priority: Each rule has a priority (between 100 and 4096). Lower numbers have higher priority.
- Source and Destination: Define the sources and destinations of the traffic.


