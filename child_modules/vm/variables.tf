variable "folder" {
  description = "The base folder the VM should be placed in"
  type        = string
}

variable "name" {
  description = "The name of the VM"
  type        = string
}

variable "nat_network" {
  description = "The NAT network the VM should be placed in"
  type        = string
}

variable "template" {
  description = "The template the VM should be imported from"
  type        = string
}
