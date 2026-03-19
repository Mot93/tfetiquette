# Inherited from a file used by boths environments 0 and environment 1
variable "env" {
  description = "Environment type"
  type        = string
}

# There is no need to define this variable because it's inherited from the terraform state of the env0
# variable "location" {
#   description = "Location of the environment"
#   type        = string
# }

# Module like variables

variable "resources_list" {
  description = "List of resources to create"
  type = map(object({
    name = string
    flag = optional(bool, true)
  }))
}

variable "resources_configs" {
  description = ""
  type = map(object({
    option_1 = string
    option_2 = string
  }))
}

variable "feature1_enabled" {
  description = "Enable feature 1. Disable feature 2"
  type        = bool
  default     = true
}

variable "feature2_enabled" {
  description = "Enable feature 2. It's ignored if feature1_enabled is set to true"
  type        = bool
  default     = false
}

variable "feature2_list" {
  description = "List of items to create in feature 2"
  type = map(object({
    name = string
  }))
  default = {}
}

# Sensitive variables

variable "password" {
  description = "Pasord, must be kept secret"
  type        = string
}