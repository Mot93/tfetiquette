resource "null_resource" "feature2_resource" {
  for_each = local.feature2_list_enabled

  triggers = {
    id              = each.key
    base_feature_id = each.value.base_feature_id
    name            = each.value.name
    env             = local.env
    location        = local.location
  }
}
