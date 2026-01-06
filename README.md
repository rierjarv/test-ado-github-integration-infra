# test-ado-github-integration-infra

This repository contains Infrastructure as Code (IaC) templates and an Azure DevOps pipeline for deploying Azure resources via Azure CLI.

## Azure DevOps Pipeline Setup

1. **Connect the Repository to Azure DevOps**:
   - In your Azure DevOps project, go to Pipelines > Pipelines.
   - Create a new pipeline and select "GitHub" as the source.
   - Authorize Azure DevOps to access your GitHub repository.
   - Select this repository and choose the `pipelines/azure-pipelines.yml` file.

2. **Configure Azure Service Connection**:
   - In Azure DevOps, go to Project Settings > Service connections.
   - Create a new service connection of type "Azure Resource Manager".
   - Choose "Service principal (automatic)" or "Service principal (manual)" and follow the prompts to authenticate with your Azure subscription.
   - Name the connection (e.g., `My-Azure-Service-Connection`) and note it for use in the pipeline variables.

3. **Update Pipeline Variables**:
   - In the pipeline YAML (`pipelines/azure-pipelines.yml`), update the following variables:
     - `azureServiceConnection`: Set to the name of your Azure service connection (e.g., `spn-subscription1-contributor`).
     - `rgName`: Set to the desired resource group name (e.g., `rej-resource-group`).
     - `location`: Set to the Azure region (e.g., `westeurope`).
     - `templatePath`: Path to your main Bicep/ARM template (default: `iac/main.bicep`).
     - `parametersPath`: Path to your parameters file (default: `iac/params.bicepparam`).

4. **Run the Pipeline**:
   - Trigger the pipeline manually.
   - The pipeline will:
     - Validate the subscription-level deployment (resource group creation).
     - Create the resource group.
     - Validate the resource group-level deployment.
     - Deploy the infrastructure to Azure.

## IaC Structure

- `iac/`: Contains Bicep templates and parameter files.
  - `create-rg.bicep`: Subscription-level template to create a resource group.
  - `create-rg.bicepparam`: Parameters for resource group creation.
  - `main.bicep`: Resource group-level template (e.g., storage account).
  - `params.bicepparam`: Parameters for the main template.

## Prerequisites

- Azure subscription with appropriate permissions.
- Azure DevOps project with GitHub integration.
- Azure CLI installed (for local testing, if needed).
