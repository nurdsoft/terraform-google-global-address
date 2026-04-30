locals {
  address_name = var.name_override != null ? var.name_override : "${var.component}-static-ip"
}
