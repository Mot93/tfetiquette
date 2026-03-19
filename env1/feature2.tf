# Since bot resources are created by the same map with the same keys they are authomatically linked by the same identifying keys

resource "random_string" "random" {
  for_each = local.feature2_list_enabled

  # Try to keep the lenght of the password as long as possible
  length  = local.random_config.length
  lower   = local.random_config.lower
  numeric = local.random_config.numeric
  special = local.random_config.special
  upper   = local.random_config.upper
  # Supplying your own list of special is always better
  # Always check what is supported and what is interpreted
  override_special = local.random_config.override_special
}

resource "null_resource" "feature2_resource" {
  for_each = local.feature2_list_enabled

  triggers = {
    id              = each.key
    base_feature_id = each.value.base_feature_id
    name            = each.value.name
    env             = var.env
    password        = var.password
    location        = local.location
    link            = local.link
    # Using the same key since both resources have the exact same identifiers
    random = resource.random_string.random[each.key].result
  }
}
