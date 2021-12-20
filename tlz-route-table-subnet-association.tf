
resource "azurerm_subnet_route_table_association" "tlz_private_subnet_route_table_association" {
  count          = var.create_vnet && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  subnet_id      = element(tolist(azurerm_subnet.tlz_private_subnet.*.id), count.index)
  route_table_id = element(tolist(azurerm_route_table.tlz_private_route_table.*.id), count.index)
  depends_on     = [azurerm_route_table.tlz_private_route_table, azurerm_subnet.tlz_private_subnet]
}

resource "azurerm_subnet_route_table_association" "tlz_public_subnet_route_table_association" {
  count          = var.create_vnet && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  subnet_id      = element(tolist(azurerm_subnet.tlz_public_subnet.*.id), count.index)
  route_table_id = element(tolist(azurerm_route_table.tlz_public_route_table.*.id), count.index)
  depends_on     = [azurerm_route_table.tlz_public_route_table, azurerm_subnet.tlz_public_subnet]
}

resource "azurerm_subnet_route_table_association" "tlz_special_subnet_route_table_association" {
  count          = (var.subnet_name == ["AzureBastionSubnet"]) || (var.subnet_name == ["AzureFirewallSubnet"]) || (var.subnet_name == ["GatewaySubnet"]) || (var.subnet_name == ["RouteServerSubnet"]) && length(var.subnet_name) > 0 ? length(var.subnet_name) : 0
  subnet_id      = element(tolist(azurerm_subnet.tlz_special_subnet.*.id), count.index)
  route_table_id = element(tolist(azurerm_route_table.tlz_special_subnet_route_table.*.id), count.index)
  depends_on     = [azurerm_route_table.tlz_special_subnet_route_table, azurerm_subnet.tlz_special_subnet]
}
