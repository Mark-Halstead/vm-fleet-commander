// Module: vm.bicep
// Purpose: Deploys a Windows Virtual Machine with configurable size, name, and admin credentials.
// Parameters:
// - vmName: Name of the virtual machine
// - location: Azure region
// - adminUsername: VM administrator username
// - adminPassword: VM administrator password
// - networkInterfaceId: ID of the NIC to attach

param vmName string
param location string
param adminUsername string
@secure()
param adminPassword string
param networkInterfaceId string

resource vm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
networkProfile: {
  networkInterfaces: [
    {
      id: networkInterfaceId
    }
  ]
}
  }
}
