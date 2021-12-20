output "vnet_name" {
  value       = join("", azurerm_virtual_network.tlz_virtual_network[*].name)
  description = "The name of the virtual network."
}
output "vnet_id" {
  value       = join("", azurerm_virtual_network.tlz_virtual_network[*].id)
  description = "The id of the virtual network."
}
