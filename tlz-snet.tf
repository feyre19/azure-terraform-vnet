#### Public SUBNET #########

resource "azurerm_subnet" "tlz_public_subnet" {
  count                                          = var.create_vnet && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  name                                           = "${var.prefix}-${var.environment}-${element(tolist(var.public_subnet_suffix), count.index)}-subnet-${var.location}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.tlz_virtual_network[0].name
  address_prefixes                               = element(tolist(tolist(var.public_subnets)), count.index)
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = false
  enforce_private_link_service_network_policies  = false

  dynamic "delegation" {
    for_each = try(var.delegation, null) == null ? [] : [1]

    content {
      name = var.delegation.name

      service_delegation {
        name    = var.delegation.service_delegation
        actions = lookup(var.delegation, "actions", null)
      }
    }
  }

}

#### Private SUBNET #########

resource "azurerm_subnet" "tlz_private_subnet" {
  count                                          = var.create_vnet && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  name                                           = "${var.prefix}-${var.environment}-${element(tolist(var.private_subnet_suffix), count.index)}-subnet-${var.location}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.tlz_virtual_network[0].name
  address_prefixes                               = element(tolist(tolist(var.private_subnets)), count.index)
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = try(var.enforce_private_link_endpoint_network_policies, false)
  enforce_private_link_service_network_policies  = try(var.enforce_private_link_service_network_policies, false)

  dynamic "delegation" {
    for_each = try(var.delegation, null) == null ? [] : [1]

    content {
      name = var.delegation.name

      service_delegation {
        name    = var.delegation.service_delegation
        actions = lookup(var.delegation, "actions", null)
      }
    }
  }

}


### Special Subnets ###

resource "azurerm_subnet" "tlz_special_subnet" {
  count                                          = (var.subnet_name == ["AzureBastionSubnet"]) || (var.subnet_name == ["AzureFirewallSubnet"]) || (var.subnet_name == ["GatewaySubnet"]) || (var.subnet_name == ["RouteServerSubnet"]) ? 1 : 0
  name                                           = element(tolist(var.subnet_name), 0)
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.tlz_virtual_network[0].name
  address_prefixes                               = var.special_subnet
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = try(var.enforce_private_link_endpoint_network_policies, false)
  enforce_private_link_service_network_policies  = try(var.enforce_private_link_service_network_policies, false)

  dynamic "delegation" {
    for_each = try(var.delegation, null) == null ? [] : [1]

    content {
      name = var.delegation.name

      service_delegation {
        name    = var.delegation.service_delegation
        actions = lookup(var.delegation, "actions", null)
      }
    }
  }
}
