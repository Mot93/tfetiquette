resource "null_resource" "feature1_resource" {
  for_each = local.feature1_list_enabled

  triggers = {
    id       = each.key
    name     = each.value.name
    env      = var.env
    password = var.password
    location = local.location
    link     = local.link
  }
}