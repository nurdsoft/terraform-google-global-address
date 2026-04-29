module "static_ip" {
  source     = "../../"
  project_id = "my-gcp-project"
  component  = "frontend"
}
# Resulting address name: "frontend-static-ip"
