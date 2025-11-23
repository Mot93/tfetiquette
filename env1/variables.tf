variable "env" {
  description = "Environment type"
  type        = string
}

variable "resources_list" {
  description = "List of resources to create"
  type = map(object({
    name = string
    flag = optional(bool, true)
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
  description = "List of items to create in "
  type = map(object({
    name = string
  }))
  default = {}
}
