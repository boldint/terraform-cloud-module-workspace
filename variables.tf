variable "terraform_cloud_org_token" {
  description = "Terraform Cloud organization. Must be setup before hand, using the Terraform Cloud bootstrap module."
  type        = string
  sensitive   = true
}

variable "organization_name" {
  description = "Terraform Cloud Organization name."
  type        = string
}

variable "workspace_name" {
  description = "Terraform Cloud Organization workspace."
  type        = string
}

variable "workspace_terraform_version" {
  description = "Terraform version to use in workspace (only if execution mode is remote)."
  type        = string
}

variable "workspace_description" {
  description = "Description of the workspace."
  type        = string
  default     = ""
}

variable "workspace_execution_mode" {
  description = "Which execution mode to use. Using Terraform Cloud, valid values are remote, local or agent. Using Terraform Enterprise, only remote and local execution modes are valid. When set to local, the workspace will be used for state storage only."
  type        = string
  default     = "remote"
}

variable "workspace_allow_destroy_plan" {
  description = "Whether destroy plans can be queued on the workspace."
  type        = bool
  default     = true
}

variable "workspace_auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  type        = bool
  default     = false
}

variable "workspace_variables" {
  description = <<EOT
Map containing all variables of the Terraform Cloud workspace.
https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
Example:
```
workspace_variables = {
  var1 = {
    value = value1
    category = "env"
    sensitive = false
    description = "a useful description"

  }
}
```
EOT
  type        = map(any)
}
