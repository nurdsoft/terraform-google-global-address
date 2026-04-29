module "static_ip" {
  source        = "../../"
  project_id    = "my-gcp-project"
  component     = "frontend"
  name_override = "my-custom-static-ip"
}
