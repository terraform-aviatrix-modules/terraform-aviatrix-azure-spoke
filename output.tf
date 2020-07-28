output "vnet" {
  description = "The created net as an object with all of it's attributes. This was created using the aviatrix_vpc resource."
  value       = aviatrix_vpc.default
}

output "spoke_gateway" {
  description = "The created Aviatrix spoke gateway as an object with all of it's attributes."
  value       = var.ha_gw ? aviatrix_spoke_gateway.ha[0] : aviatrix_spoke_gateway.single[0]
}