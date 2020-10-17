# Create an Azure VNet
resource "aviatrix_vpc" "default" {
  cloud_type           = 8
  account_name         = var.account
  region               = var.region
  name                 = local.name
  cidr                 = var.cidr
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "default" {
  cloud_type         = 8
  account_name       = var.account
  gw_name            = local.name
  vpc_id             = aviatrix_vpc.default.vpc_id
  vpc_reg            = var.region
  gw_size            = var.instance_size
  ha_gw_size         = var.ha_gw ? var.instance_size : null
  subnet             = local.subnet
  ha_subnet          = var.ha_gw ? local.ha_subnet : null
  insane_mode        = var.insane_mode
  enable_active_mesh = var.active_mesh
  transit_gw         = var.transit_gw
}
