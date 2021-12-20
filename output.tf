# VNET

output "vnet_name" {
  value       = join("", azurerm_virtual_network.tlz_virtual_network[*].name)
  description = "The name of the virtual network."
}
output "vnet_id" {
  value       = join("", azurerm_virtual_network.tlz_virtual_network[*].id)
  description = "The id of the virtual network."
}

# SUBNET

output "gateway_subnet_id" {
  value       = join("", azurerm_subnet.tlz_special_subnet[*].id)
  description = "The id of the GatewaySubnet."
}

output "gateway_subnet_name" {
  value       = join("", azurerm_subnet.tlz_special_subnet[*].name)
  description = "The name of the GatewaySubnet."
}

output "private_subnet_id" {
  value       = azurerm_subnet.tlz_private_subnet.*.id
  description = "The list of subnet ids of private subnets."
}
output "public_subnet_id" {
  value       = azurerm_subnet.tlz_public_subnet.*.id
  description = "The list of subnet ids of public subnets."
}

output "private_subnet_name" {
  value       = azurerm_subnet.tlz_private_subnet.*.name
  description = "The list of private subnet name."
}

output "public_subnet_name" {
  value       = azurerm_subnet.tlz_public_subnet.*.name
  description = "The list of public subnet name."
}

output "private_route_table_id" {
  value       = azurerm_route_table.tlz_private_route_table.*.id
  description = "The list of private route table ids."
}
output "public_route_table_id" {
  value       = azurerm_route_table.tlz_public_route_table.*.id
  description = "The list of public route table ids."
}
