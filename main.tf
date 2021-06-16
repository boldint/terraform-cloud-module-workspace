resource "tfe_workspace" "workspace" {
  name               = var.workspace_name
  organization       = var.organization_name
  terraform_version  = var.workspace_terraform_version
  description        = var.workspace_description
  execution_mode     = var.workspace_execution_mode
  allow_destroy_plan = var.workspace_allow_destroy_plan
  auto_apply         = var.workspace_auto_apply
}

resource "tfe_variable" "variable" {
  for_each     = var.workspace_variables
  key          = each.key
  value        = each.value.value
  category     = each.value.category
  workspace_id = tfe_workspace.workspace.id
  description  = each.value.description
  sensitive    = each.value.sensitive
  hcl          = each.value.hcl
}
