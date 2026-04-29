resource "google_compute_global_address" "this" {
  project      = var.project_id
  name         = local.address_name
  address_type = var.address_type
}
