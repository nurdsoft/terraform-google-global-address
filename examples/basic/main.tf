module "static_ip" {
  source     = "git::https://github.com/nurdsoft/terraform-google-global-address.git?ref=v1.0.0"
  project_id = "my-gcp-project"
  component  = "frontend"
}
