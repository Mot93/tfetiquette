output "location" {
  description = "Location of the resources"
  value       = local.location
}

output "feature_output" {
  value = resource.null_resource.res0.triggers.name
}
