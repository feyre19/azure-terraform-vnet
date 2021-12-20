<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Usage

### Deploy virtual network and subnets with given address space.

```hcl

module "tlz_virtual_network" {
  source                = "https://github.com/feyre19/azure-terraform-vnet"
  create_vnet           = var.create_vnet_primary
  prefix                = var.prefix
  resource_group_name   = module.tlz_resource_group.resource_group.name
  address_space         = ["10.0.0/16"]
  private_subnets       = [["10.0.10.0/24"]]
  private_subnet_suffix = ["private"]
  public_subnets        = [["10.0.20.0/24"]]
  public_subnet_suffix  = ["public"]
  location              = var.region_primary
  vnet_name             = "demo"
  environment           = var.environment
  tags                  = module.tlz_tagging.tags
}
```
## Resources

| Name | Type |
|------|------|
| [azurerm_route.tlz_private_route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.tlz_public_route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.tlz_private_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_route_table.tlz_public_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_route_table.tlz_special_subnet_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.tlz_private_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.tlz_public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.tlz_special_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.tlz_private_subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.tlz_public_subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.tlz_special_subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.tlz_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_private_routes"></a> [additional\_private\_routes](#input\_additional\_private\_routes) | A flag to create additional routes if needed. | `bool` | `false` | no |
| <a name="input_additional_public_routes"></a> [additional\_public\_routes](#input\_additional\_public\_routes) | A flag to create additional routes if needed. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | (Required) The address space that is used the virtual network | `any` | n/a | yes |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Controls if VNET should be created (it affects almost all resources) | `any` | n/a | yes |
| <a name="input_ddos_id"></a> [ddos\_id](#input\_ddos\_id) | The ddos id for the network. | `string` | `""` | no |
| <a name="input_delegation"></a> [delegation](#input\_delegation) | It defines delegating services to subnet | `any` | `null` | no |
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | (Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | `false` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) List of IP addresses of DNS servers | `list` | `[]` | no |
| <a name="input_enforce_private_link_endpoint_network_policies"></a> [enforce\_private\_link\_endpoint\_network\_policies](#input\_enforce\_private\_link\_endpoint\_network\_policies) | (Optional) Enable or Disable network policies for the private link endpoint on the subnet | `bool` | `false` | no |
| <a name="input_enforce_private_link_service_network_policies"></a> [enforce\_private\_link\_service\_network\_policies](#input\_enforce\_private\_link\_service\_network\_policies) | (Optional) Enable or Disable network policies for the private link service on the subnet | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The environment platform in which resources will be deployed, e.g. dev. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location/region where the resource is created, e.g. centralus. | `string` | `"centralus"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) A prefix for resource name e.g. tlz - Terraform Landing Zone. | `string` | n/a | yes |
| <a name="input_private_routes"></a> [private\_routes](#input\_private\_routes) | Routes defined for private subnet. | `map` | `{}` | no |
| <a name="input_private_subnet_suffix"></a> [private\_subnet\_suffix](#input\_private\_subnet\_suffix) | Suffix to append to private subnets name | `list` | <pre>[<br>  "private"<br>]</pre> | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnets inside the vnet | `list` | `[]` | no |
| <a name="input_public_routes"></a> [public\_routes](#input\_public\_routes) | Routes defined for public subnet. | `map` | `{}` | no |
| <a name="input_public_subnet_suffix"></a> [public\_subnet\_suffix](#input\_public\_subnet\_suffix) | Suffix to append to public subnets name | `list` | <pre>[<br>  "public"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of public subnets inside the vnet | `list` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the virtual network | `any` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | (Optional) The list of Service endpoints to associate with the subnet | `list` | `[]` | no |
| <a name="input_special_subnet"></a> [special\_subnet](#input\_special\_subnet) | An address prefix for special subnets inside the vnet | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | (Required) An identifier special subnet e.g. GatewaySubnet . | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to be applied to the resource | `map(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | (Required) The name of the virutal network that will be deployed. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_subnet_id"></a> [gateway\_subnet\_id](#output\_gateway\_subnet\_id) | The id of the GatewaySubnet. |
| <a name="output_gateway_subnet_name"></a> [gateway\_subnet\_name](#output\_gateway\_subnet\_name) | The name of the GatewaySubnet. |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | The list of private route table ids. |
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | The list of subnet ids of private subnets. |
| <a name="output_private_subnet_name"></a> [private\_subnet\_name](#output\_private\_subnet\_name) | The list of private subnet name. |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | The list of public route table ids. |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | The list of subnet ids of public subnets. |
| <a name="output_public_subnet_name"></a> [public\_subnet\_name](#output\_public\_subnet\_name) | The list of public subnet name. |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The id of the virtual network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the virtual network. |
<!-- END_TF_DOCS -->
