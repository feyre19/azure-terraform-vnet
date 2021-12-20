<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.tlz_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Usage

### Deploy virtual network with given address space.
```hcl

module "tlz_virtual_network" {
  source               = "https://github.com/feyre19/azure-terraform-vnet.git"
  create_vnet          = var.create_vnet_primary
  prefix               = var.prefix
  resource_group_name  = module.tlz_resource_group.resource_group.name
  address_space        = ["10.0.0/16"]
  location             = var.region_primary
  vnet_name            = "demo"
  environment          = var.environment
  tags                 = module.tlz_tagging.tags
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | (Required) The address space that is used to create virtual network | `any` | n/a | yes |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Controls if VNET should be created (it affects almost all resources) | `any` | n/a | yes |
| <a name="input_ddos_id"></a> [ddos\_id](#input\_ddos\_id) | The ddos id for the network. | `string` | `""` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) List of IP addresses of DNS servers | `list` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The environment platform in which resources will be deployed, e.g. dev. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location/region where the resource is created, e.g. centralus. | `string` | `"centralus"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) A prefix for resource name e.g. tlz - Terraform Landing Zone. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the virtual network | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to be applied to the resource | `map(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | (Required) The name of the virutal network that will be deployed. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The id of the virtual network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the virtual network. |

<!-- END_TF_DOCS -->
