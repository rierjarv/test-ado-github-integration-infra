// Simple Bicep template used for testing Azure CLI pipeline
@description('Creates a storage account for test purposes')
param storageAccountName string
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}

output storageAccountId string = storageAccount.id
