variable "location" {
  description = "(Required) The location/region where the resource is created, e.g. centralus."
  default     = "centralus"
}

variable "prefix" {
  description = "(Required) A prefix for resource name e.g. tlz - Terraform Landing Zone."
  type        = string
}

variable "environment" {
  description = "(Required) The environment platform in which resources will be deployed, e.g. dev."
  default     = "dev"
}

variable "create_vnet" {
  description = "Controls if VNET should be created (it affects almost all resources)"
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the virtual network"
}

variable "address_space" {
  description = "(Required) The address space that is used the virtual network"
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  default     = []
}

variable "ddos_id" {
  description = "The ddos id for the network."
  default     = ""
}

variable "tags" {
  description = "(Required) Map of tags to be applied to the resource"
  type        = map(any)
}

variable "vnet_name" {
  description = "(Required) The name of the virutal network that will be deployed."
}

variable "subnet_name" {
  description = "(Required) An identifier special subnet e.g. GatewaySubnet ."
  default     = ""
}

variable "public_subnets" {
  description = "A list of public subnets inside the vnet"
  default     = []
}

variable "special_subnet" {
  description = "An address prefix for special subnets inside the vnet"
  default     = ""
}
variable "private_subnets" {
  description = "A list of private subnets inside the vnet"
  default     = []
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  default     = ["public"]
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  default     = ["private"]
}

variable "public_routes" {
  description = "Routes defined for public subnet."
  default     = {}
}

variable "private_routes" {
  description = "Routes defined for private subnet."
  default     = {}
}

variable "additional_private_routes" {
  description = "A flag to create additional routes if needed."
  default     = false
}

variable "additional_public_routes" {
  description = "A flag to create additional routes if needed."
  default     = false
}

variable "service_endpoints" {
  description = " (Optional) The list of Service endpoints to associate with the subnet"
  default     = []
}

variable "enforce_private_link_endpoint_network_policies" {
  description = " (Optional) Enable or Disable network policies for the private link endpoint on the subnet"
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = " (Optional) Enable or Disable network policies for the private link service on the subnet"
  default     = false
}

variable "delegation" {
  description = "It defines delegating services to subnet"
  default     = null
}

variable "disable_bgp_route_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default     = false
}
