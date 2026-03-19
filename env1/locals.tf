# It's not necessary to split in so many blocks the locals but it make it easier to read

#
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

# Use 

# Feature 1 configurations

locals {
  # TODO: create a list that uses flat() function when using double loops
  #feature1_list = { for k,v in var.resources_list : }
  # Create the resources only if the rigth set of conditions is met
  #feature1_list_enabled = var.feature1_enabled == true ? local.feature1_list : {}
  # Create a list with only the element that have flag set to true
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
      name            = value.name
      base_feature_id = resource.null_resource.base_resource[key].id
    } if value.flag == true
  }
  # Create the resources only if the feature 1 is disabled and if feature 2 is enabled
  feature2_list_enabled = var.feature1_enabled == false && var.feature2_enabled == true ? local.feature2_list : {}
}
