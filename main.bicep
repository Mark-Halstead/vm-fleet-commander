param projectName string = 'vmfleet'
param location string = resourceGroup().location

var vmName = '${projectName}-vm01'
var vnetName = '${projectName}-vnet'

output vmName string = vmName
output vnetName string = vnetName

module vm './vm.bicep' = {
  name: 'vmDeploy'
  params: {
    vmName: '${projectName}-vm01'
    location: location
    adminUsername: 'azureuser'
    adminPassword: 'ReplaceThisWithASecurePassword123!'
  }
}
