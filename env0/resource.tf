resource "null_resource" "resource_0" {

  # Avoid leaving hard coded values around in the project
  # Pull all hardcoded values from the local definitions
  triggers = {
    id       = local.resource_0.id
    name     = local.resource_0.name
    env      = var.env
    location = local.location
  }
}