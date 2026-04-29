variable "project_id" {
  description = "The GCP project ID where the static IP will be reserved."
  type        = string
}

variable "component" {
  description = "Component name used to generate the address name. Resulting name: '<component>-static-ip'. Must be lowercase letters, numbers, and hyphens; max 53 characters."
  type        = string

  validation {
    condition     = can(regex("^[a-z]([-a-z0-9]{0,51}[a-z0-9])?$", var.component))
    error_message = "component must start with a lowercase letter, contain only lowercase letters, numbers, and hyphens, not end with a hyphen, and be at most 53 characters (so '<component>-static-ip' stays within GCP's 63-character limit)."
  }
}

variable "name_override" {
  description = "If set, overrides the auto-generated address name entirely. Must comply with GCP naming rules: lowercase letters, numbers, and hyphens; start with a letter; end with a letter or number; max 63 characters."
  type        = string
  default     = null

  validation {
    condition     = var.name_override == null || (length(var.name_override) <= 63 && can(regex("^[a-z]([-a-z0-9]*[a-z0-9])?$", var.name_override)))
    error_message = "name_override must start with a lowercase letter, contain only lowercase letters, numbers, and hyphens, end with a letter or number, and be at most 63 characters."
  }
}

variable "address_type" {
  description = "The type of address to reserve. EXTERNAL for public IPs used with load balancers; INTERNAL for private services such as Private Service Connect or VPC Network Peering."
  type        = string
  default     = "EXTERNAL"

  validation {
    condition     = contains(["EXTERNAL", "INTERNAL"], var.address_type)
    error_message = "address_type must be either EXTERNAL or INTERNAL."
  }
}
