locals {
  env      = data.terraform_remote_state.env0.outputs.environment
  location = data.terraform_remote_state.env0.outputs.location
  # TODO: create a list that uses flat() function when using double loops
  #feature1_list = { for k,v in var.resources_list : }
  # Create the resources only if the rigth set of conditions is met
  #feature1_list_enabled = var.feature1_enabled == true ? local.feature1_list : {}
  # Create a list with only the element that have flag set to true
  feature2_list = { for key, value in var.resources_list : key => {
    name            = value.name
    base_feature_id = resource.null_resource.base_resource[key].id
    } if value.flag == true
  }
  # Create the resources only if the rigth set of conditions is met
  feature2_list_enabled = var.feature1_enabled == false && var.feature2_enabled == true ? local.feature2_list : {}
}
