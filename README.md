# terraform-aviatrix-azure-spoke

### Description
This module deploys a very simple spoke VNET.

### Compatibility
Module version | Terraform version | Controller version | Terraform provider version
:--- | :--- | :--- | :---
v1.1.0 | 0.12 | |
v1.0.2 | 0.12 | |
v1.0.1 | 0.12 | |
v1.0.0 | 0.12 | |

### Diagram
<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-azure-spoke/blob/master/img/azure-ha.png?raw=true" height="250">

with ha_gw set to false, the following will be deployed:

<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-azure-spoke/blob/master/img/azure-single.png?raw=true" height="250">

### Usage Example
```
module "spoke_azure_1" {
  source  = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version = "1.1.0"

  name = "my-spoke"
  cidr = "10.1.0.0/20"
  region = "Japan East"
  account = "Azure"
  transit_gw = "tg-japan-east"
}
```

### Variables
The following variables are required:

key | value
:--- | :---
name | avx-\<name\>-spoke
region | AWS region to deploy this VNET in
cidr | What ip CIDR to use for this VNET
account | The account name as known by the Aviatrix controller
transit_gw | The name of the transit gateway we want to attach this spoke to

The following variables are optional:

key | default | value 
:---|:---|:---
instance_size | Standard_B1ms | The size of the Aviatrix spoke gateways. **Insane mode requires a minimum Standard_D3_v2 instance size**
ha_gw | true | Set to false if you only want to deploy a single Aviatrix spoke gateway
active_mesh | true | Set to false to disable active_mesh
insane_mode | false | Set to true to enable Aviatrix insane mode high-performance encryption

### Outputs
This module will return the following outputs:

key | description
:---|:---
vnet | The created VNET as an object with all of it's attributes. This was created using the aviatrix_vpc resource.
spoke_gateway | The created Aviatrix spoke gateway as an object with all of it's attributes.
