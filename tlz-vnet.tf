#### VNET ####

resource "azurerm_virtual_network" "tlz_virtual_network" {
  count               = var.create_vnet ? 1 : 0
  name                = "${var.prefix}-${var.environment}-${var.vnet_name}-${local.resource_type}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags = merge(
    {
      "Name" = "${var.prefix}-${var.environment}-${var.vnet_name}-${local.resource_type}-${var.location}"
    },
    var.tags
  )

  dns_servers = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_id != "" ? [1] : []

    content {
      id     = var.ddos_id
      enable = true
    }
  }
}
