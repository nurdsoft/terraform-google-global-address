variable "project_id" {
  description = "The GCP project ID where the static IP will be reserved."
  type        = string
}

variable "component" {
  description = "Component name used to generate the address name. Resulting name: '<component>-static-ip'."
  type        = string
}

variable "name_override" {
  description = "If set, overrides the auto-generated address name entirely."
  type        = string
  default     = null
}
