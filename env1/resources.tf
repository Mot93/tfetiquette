resource "null_resource" "base_resource" {
  for_each = var.resources_list

  triggers = {
    id       = each.key
    name     = each.value.name
    flag     = each.value.flag
    env      = local.env
    location = local.location
  }
}
