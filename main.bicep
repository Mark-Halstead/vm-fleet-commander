param location string = 'uksouth'
param projectName string = 'vmfleet'

var resourceGroupName = '${projectName}-rg'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
