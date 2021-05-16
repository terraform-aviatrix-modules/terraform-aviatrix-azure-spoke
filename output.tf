output "vnet" {
  description = "The created net as an object with all of it's attributes. This was created using the aviatrix_vpc resource."
  value       = var.use_existing_vnet ? null : aviatrix_vpc.default[0]
}

output "spoke_gateway" {
  description = "The created Aviatrix spoke gateway as an object with all of it's attributes."
  value       = aviatrix_spoke_gateway.default
}