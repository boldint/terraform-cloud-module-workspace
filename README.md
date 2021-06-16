# Terraform Cloud Workspace module

Terraform module for creating / updating a Terraform Cloud Workspace.

[//]: # (Do not make changes below this line)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.variable](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Terraform Cloud Organization name. | `string` | n/a | yes |
| <a name="input_terraform_cloud_org_token"></a> [terraform\_cloud\_org\_token](#input\_terraform\_cloud\_org\_token) | Terraform Cloud organization. Must be setup before hand, using the Terraform Cloud bootstrap module. | `string` | n/a | yes |
| <a name="input_workspace_allow_destroy_plan"></a> [workspace\_allow\_destroy\_plan](#input\_workspace\_allow\_destroy\_plan) | Whether destroy plans can be queued on the workspace. | `bool` | `true` | no |
| <a name="input_workspace_auto_apply"></a> [workspace\_auto\_apply](#input\_workspace\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `false` | no |
| <a name="input_workspace_description"></a> [workspace\_description](#input\_workspace\_description) | Description of the workspace. | `string` | `""` | no |
| <a name="input_workspace_execution_mode"></a> [workspace\_execution\_mode](#input\_workspace\_execution\_mode) | Which execution mode to use. Using Terraform Cloud, valid values are remote, local or agent. Using Terraform Enterprise, only remote and local execution modes are valid. When set to local, the workspace will be used for state storage only. | `string` | `"remote"` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Terraform Cloud Organization workspace. | `string` | n/a | yes |
| <a name="input_workspace_terraform_version"></a> [workspace\_terraform\_version](#input\_workspace\_terraform\_version) | Terraform version to use in workspace (only if execution mode is remote). | `string` | n/a | yes |
| <a name="input_workspace_variables"></a> [workspace\_variables](#input\_workspace\_variables) | Map containing all variables of the Terraform Cloud workspace.<br>https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable<br>Example:<pre>workspace_variables = {<br>  var1 = {<br>    value = value1<br>    category = "env"<br>    sensitive = false<br>    description = "a useful description"<br><br>  }<br>}</pre> | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace"></a> [workspace](#output\_workspace) | Terraform Cloud workspace name. |
| <a name="output_workspace_variables"></a> [workspace\_variables](#output\_workspace\_variables) | Terraform Cloud workspace variables. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
