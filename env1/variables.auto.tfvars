# Variables should be used for sensistive data and modules
# *.auto.tfvars will be read auromatically by terraform withouth having to specify it via 

# Module like variables

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

resources_configs = {
  "config_1" = {
    option_1 = "First option"
    option_2 = "First option but second"
  }
  "config_2" = {
    option_1 = "First option but second"
    option_2 = "Second option"
  }
}

feature1_enabled = false
feature2_enabled = true

# Sensitive informations

password = "123abc"
