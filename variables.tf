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
