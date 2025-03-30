resource myVM 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 'myVM'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
  }
}
