param projectName string = 'vmfleet'
param location string = resourceGroup().location

var vmName = '${projectName}-vm01'
var vnetName = '${projectName}-vnet'
var nsgName = '${projectName}-nsg'
var nicName = '${projectName}-nic'
var pipName = '${projectName}-pip'

module vnetMod './vnet.bicep' = {
  name: 'vnetDeploy'
  params: {
    vnetName: vnetName
    location: location
  }
}

module nsgMod './nsg.bicep' = {
  name: 'nsgDeploy'
  params: {
    nsgName: nsgName
    location: location
  }
}

module nicMod './nic.bicep' = {
  name: 'nicDeploy'
  params: {
    nicName: nicName
    location: location
    subnetId: vnetMod.outputs.subnetId
    nsgId: nsgMod.outputs.nsgId
    pipId: pipMod.outputs.pipId
  }
}

module pipMod './pip.bicep' = {
  name: 'pipDeploy'
  params: {
    pipName: pipName
    location: location
  }
}

module vm './vm.bicep' = {
  name: 'vmDeploy'
  params: {
    vmName: vmName
    location: location
    adminUsername: 'azureuser'
    adminPassword: 'ReplaceThisWithASecurePassword123!'
    networkInterfaceId: nicMod.outputs.nicId
  }
}
