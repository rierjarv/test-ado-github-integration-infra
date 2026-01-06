targetScope = 'subscription'

@description('Creates a resource group at subscription scope')
param rgName string
param location string = 'westeurope'

resource rg 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: rgName
  location: location
}

output resourceGroupId string = rg.id
