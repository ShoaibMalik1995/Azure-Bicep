# Azure Bicep - Overview of Logic Apps (Standard)

## Overview
Azure Logic Apps is a cloud service that automates workflows and integrates apps, data, services, and systems. This README file provides a guide on creating, deploying, and managing Azure Logic Apps using Bicep templates.

## Azure Logic Apps - Consumption Vs Standard

### Consumption
- It's called as Multi-Tenant Logic Apps
- Can have only one workflow in a given Logic Apps
- Createing custom connectors is not straight forward
- Supporting for Virtual Nertworks and Private end points is not allowed

### Standard
- It's called as Single Tenant Logic Apps
- Can have multiple workflows in one Logic Apps
- Creating custom connector is easy
- Supporting for Virtual Networks and Private end points is available

