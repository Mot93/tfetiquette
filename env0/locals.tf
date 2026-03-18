# All non sensitive values should be defined in the locals.
# This makes it easier to manage the project configurations.

locals {
  location = "Europe"
  # Group same scope variables inside objects
  resource_0 = {
    id = "Zero"
    name = "Chronos"
  }
}