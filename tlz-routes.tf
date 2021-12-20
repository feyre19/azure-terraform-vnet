resource "azurerm_route" "tlz_public_route" {
  for_each = {
    for k, v in var.public_routes : k => v
    if var.create_vnet && var.additional_public_routes && length(var.public_subnets) > 0
  }
  name                   = "${var.prefix}-${var.environment}-${each.value.route_name}-route-${var.location}"
  resource_group_name    = var.resource_group_name
  route_table_name       = each.value.route_table_name
  address_prefix         = try(each.value.address_prefix, null)
  next_hop_type          = try(each.value.next_hop_type, null)
  next_hop_in_ip_address = try(lower(each.value.next_hop_type), null) == "virtualappliance" ? each.value.next_hop_in_ip_address : null
}
resource "azurerm_route" "tlz_private_route" {
  for_each = {
    for k, v in var.private_routes : k => v
    if var.create_vnet && var.additional_private_routes && length(var.private_subnets) > 0
  }
  name                   = "${var.prefix}-${var.environment}-${each.value.route_name}-route-${var.location}"
  resource_group_name    = var.resource_group_name
  route_table_name       = each.value.route_table_name
  address_prefix         = try(each.value.address_prefix, null)
  next_hop_type          = try(each.value.next_hop_type, null)
  next_hop_in_ip_address = try(lower(each.value.next_hop_type), null) == "virtualappliance" ? each.value.next_hop_in_ip_address : null
}
