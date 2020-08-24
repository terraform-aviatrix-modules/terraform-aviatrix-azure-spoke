variable "spoke_name" {
  type = string
}

variable "region" {
  type = string
}

variable "cidr" {
  type = string
}

variable "account" {
  type = string
}

variable "instance_size" {
  type    = string
  default = "Standard_B1ms"
}

variable "ha_gw" {
  type    = bool
  default = true
}

variable "transit_gw" {
  type = string
}
