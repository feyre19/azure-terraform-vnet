## Private Subnet Route table ##
resource "azurerm_route_table" "tlz_private_route_table" {
  count                         = var.create_vnet && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  name                          = "${var.prefix}-${var.environment}-${element(tolist(var.private_subnet_suffix), count.index)}-routetable-${var.location}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  disable_bgp_route_propagation = try(var.disable_bgp_route_propagation, false)
  # sample route to prevent traffic to internet.
  route {
    name           = "${var.prefix}-${var.environment}-vng-route-outbound"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualNetworkGateway"
  }
  tags = merge(
    {
      "Name" = "${var.prefix}-${var.environment}-${element(tolist(var.private_subnet_suffix), count.index)}-routetable-${var.location}"
    },
    var.tags
  )
}

## public Subnet Route table ##
resource "azurerm_route_table" "tlz_public_route_table" {
  count                         = var.create_vnet && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  name                          = "${var.prefix}-${var.environment}-${element(tolist(var.public_subnet_suffix), count.index)}-routetable-${var.location}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  disable_bgp_route_propagation = try(var.disable_bgp_route_propagation, false)
  tags = merge(
    {
      "Name" = "${var.prefix}-${var.environment}-${element(tolist(var.public_subnet_suffix), count.index)}-routetable-${var.location}"
    },
    var.tags
  )
}

### Route Table for Special Subnet ###

resource "azurerm_route_table" "tlz_special_subnet_route_table" {
  count                         = (var.subnet_name == ["AzureBastionSubnet"]) || (var.subnet_name == ["AzureFirewallSubnet"]) || (var.subnet_name == ["GatewaySubnet"]) || (var.subnet_name == ["RouteServerSubnet"]) ? 1 : 0
  name                          = "${var.prefix}-${var.environment}-${lower(element(tolist(var.subnet_name), count.index))}-routetable-${var.location}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  disable_bgp_route_propagation = try(var.disable_bgp_route_propagation, false)
  tags = merge(
    {
      "Name" = "${var.prefix}-${var.environment}-${lower(element(tolist(var.subnet_name), count.index))}-routetable-${var.location}"
    },
    var.tags
  )
}
