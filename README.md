# terraform-aviatrix-azure-spoke

### Description
This module deploys a very simple spoke VNET.

### Diagram
\<Provide a diagram of the high level constructs thet will be created by this module>
<img src="<IMG URL>"  height="250">

### Usage Example
```
module "spoke_azure_1" {
  source  = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version = "1.0.0"

  spoke_name = "my_first_spoke"
  cidr = "10.1.0.0/20"
  region = "Japan East"
  azure_account_name = "Azure"
  transit_gw = "tg-japan-east"
}
```

### Variables
The following variables are required:

key | value
:--- | :---
spoke_name | Name for this spoke VNET and it's gateways
region | AWS region to deploy this VNET in
cidr | What ip CIDR to use for this VNET
azure_account_name | The account name as known by the Aviatrix controller
transit_gw | The name of the transit gateway we want to attach this spoke to

The following variables are optional:

key | default | value 
:---|:---|:---
instance_size | Standard_B1ms | The size of the Aviatrix spoke gateways
ha_gw | true | Set to false if you only want to deploy a single Aviatrix spoke gateway

### Outputs
This module will return the following outputs:

key | description
:---|:---
vnet | The created VNET as an object with all of it's attributes. This was created using the aviatrix_vpc resource.
spoke_gateway | The created Aviatrix spoke gateway as an object with all of it's attributes.
