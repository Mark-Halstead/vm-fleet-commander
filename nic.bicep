param nicName string
param location string
param subnetId string
param nsgId string

resource nic 'Microsoft.Network/networkInterfaces@2021-08-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgId
    }
  }
}

output nicId string = nic.id
