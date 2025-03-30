param pipName string
param location string

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: pipName
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
  sku: {
    name: 'Basic'
  }
}

output pipId string = publicIP.id
