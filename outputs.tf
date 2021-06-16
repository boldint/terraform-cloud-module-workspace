output "workspace" {
  description = "Terraform Cloud workspace name."
  value       = tfe_workspace.workspace.id
}

output "workspace_variables" {
  description = "Terraform Cloud workspace variables."
  value       = { for name, value in var.workspace_variables : name => value }
}
