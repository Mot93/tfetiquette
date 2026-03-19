output "feature1_list" {
  value = local.feature1_list_enabled
}

# Output attributes of a resource created a number of times
output "feature2_random" {
  value = {
    for k, v in random_string.random :
    k => v.result
  }
}

output "feature2_list" {
  value = local.feature2_list_enabled
}