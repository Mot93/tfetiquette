# It's not necessary to split in so many blocks the locals but it make it easier to read

# General configurations to use acrsoss the whole project

locals {
  location = data.terraform_remote_state.env0.outputs.location
  link     = data.terraform_remote_state.env0.outputs.feature_output
  resources_list = {
    first = {
      name = "Mike"
    }
    second = {
      name = "Claire"
      flag = false
    }
    third = {
      name = "Francesca"
    }
  }

  feature1_enabled = false
  feature2_enabled = true
}

# Feature 1 configurations
# Create a series of resources based on two list that have to be combined.
# The list resources_list contains all the resources to create, 
#   while resources_configs has the configurations to apply at each resources.
# This means that for each resources a copy has to be created for each specified set of options.

locals {
  feature1_list = flatten([
    for key, value in var.resources_list : [
      for k, v in var.resources_configs : {
        key   = "${key}_${k}"
        name  = value.name
        link  = local.link
        opt_1 = v.option_1
        opt_2 = v.option_2
      }
    ]
  ])
  # Turn the list into a map
  # Quick and dirty
  feature1_map = { for value in local.feature1_list : value.key => value }
  # Clean
  # feature1_map = {
  #   for value in local.feature1_list : value.key => {
  #     name  = value.name
  #     link  = value.link
  #     opt_1 = value.opt_1
  #     opt_2 = value.opt_1
  #   }
  # }
  # Create the resources only if the rigth set of conditions is met
  feature1_list_enabled = var.feature1_enabled == true ? local.feature1_map : {}
}

# Feature 2 configurations
# Create a list later used to defined resources
# This is an example of how to manage a dynamic list of resources in terraform
# Resources 2 are created only if var.resources_list.flag == true

locals {
  random_config = {
    # Try to keep the lenght of the password as long as possible
    length  = 16
    lower   = true
    numeric = true
    special = true
    upper   = true
    # Supplying your own list of special is always better
    # Always check what is supported and what is interpreted
    override_special = "{}£"
  }
  # Features 2 list is created always regardles
  feature2_list = {
    for key, value in var.resources_list : key => {
      name = value.name
      # Getting a property of another resource with the same ID
      base_feature_id = resource.null_resource.base_resource[key].id
      # Create the resource only if the flag is set to true
    } if value.flag == true
  }
  # Create the resources only if the feature 1 is disabled and if feature 2 is enabled
  feature2_list_enabled = var.feature1_enabled == false && var.feature2_enabled == true ? local.feature2_list : {}
}
