# Azure Bicep - Design Patterns - Configuration Set

## Overview
This document explains the Azure Bicep Design Pattern known as the Configuration Set. Microsoft currently recommends four design patterns for Bicep, and this session focuses on the first one: the Configuration Set.

## What is a Configuration Set?
A Configuration Set helps manage and configure parameter values based on different environments. This pattern allows for flexible deployment of Azure resources, ensuring that the appropriate tier (higher or lower) is selected based on the environment, thus helping to manage costs effectively.

## Why Use Configuration Sets?
- **Environment-Specific Configuration**: Tailor resource configurations to suit different environments, such as production, development, and testing.
- **Cost Management**: Deploy resources in a cost-effective manner by adjusting the tier or size of resources based on the environment.
- **Reusability**: Promote reusable and maintainable code by defining common configuration sets that can be easily applied across multiple environments.

