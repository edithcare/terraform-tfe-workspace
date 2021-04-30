# terraform-tfe-workspace

> terrafrom module used @edithcare for creating tfe workspaces

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 0.14.11 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_notification_configuration.slack](https://registry.terraform.io/providers/hashicorp/tfe/0.25.0/docs/resources/notification_configuration) | resource |
| [tfe_team_access.acces](https://registry.terraform.io/providers/hashicorp/tfe/0.25.0/docs/resources/team_access) | resource |
| [tfe_variable.variable](https://registry.terraform.io/providers/hashicorp/tfe/0.25.0/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/0.25.0/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_slack_enabled"></a> [slack\_enabled](#input\_slack\_enabled) | value | `bool` | `false` | no |
| <a name="input_slack_triggers"></a> [slack\_triggers](#input\_slack\_triggers) | value | `list(string)` | <pre>[<br>  "run:created",<br>  "run:completed",<br>  "run:errored",<br>  "run:needs_attention"<br>]</pre> | no |
| <a name="input_slack_url"></a> [slack\_url](#input\_slack\_url) | value | `string` | n/a | yes |
| <a name="input_team_access"></a> [team\_access](#input\_team\_access) | value | <pre>list(object({<br>    name   = string<br>    id     = string<br>    access = string<br>  }))</pre> | `[]` | no |
| <a name="input_tf_variables"></a> [tf\_variables](#input\_tf\_variables) | value | <pre>list(object({<br>    category    = string<br>    name        = string<br>    value       = string<br>    sensitive   = optional(bool)<br>    hcl         = optional(bool)<br>    description = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_workspace_auto_apply"></a> [workspace\_auto\_apply](#input\_workspace\_auto\_apply) | (Required) Whether destroy plans can be queued on the workspace. | `bool` | n/a | yes |
| <a name="input_workspace_file_triggers_enabled"></a> [workspace\_file\_triggers\_enabled](#input\_workspace\_file\_triggers\_enabled) | (Optional) Whether to filter runs based on the changed files in a VCS push. | `bool` | `true` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | (Required) Name of the workspace. | `string` | n/a | yes |
| <a name="input_workspace_org"></a> [workspace\_org](#input\_workspace\_org) | (Required) Name of the organization. | `string` | `"edithcare"` | no |
| <a name="input_workspace_queue_all_runs"></a> [workspace\_queue\_all\_runs](#input\_workspace\_queue\_all\_runs) | (Optional) Whether the workspace should start automatically performing runs immediately after its creation. | `bool` | `false` | no |
| <a name="input_workspace_terraform_version"></a> [workspace\_terraform\_version](#input\_workspace\_terraform\_version) | (Required) The version of Terraform to use for this workspace. | `string` | n/a | yes |
| <a name="input_workspace_trigger_prefixes"></a> [workspace\_trigger\_prefixes](#input\_workspace\_trigger\_prefixes) | (Optional) List of repository-root-relative paths which describe all locations to be tracked for changes | `list(string)` | `[]` | no |
| <a name="input_workspace_vcs_branch"></a> [workspace\_vcs\_branch](#input\_workspace\_vcs\_branch) | (Optional) repository branch that Terraform will execute from. Default to `master` | `string` | `"master"` | no |
| <a name="input_workspace_vcs_identifier"></a> [workspace\_vcs\_identifier](#input\_workspace\_vcs\_identifier) | (Required) A reference to your VCS repository in the format <organization>/<repository> where <organization> and <repository> refer to the organization and repository in your VCS provider. | `string` | n/a | yes |
| <a name="input_workspace_vcs_ingress_submodules"></a> [workspace\_vcs\_ingress\_submodules](#input\_workspace\_vcs\_ingress\_submodules) | (Optional) Whether submodules should be fetched when cloning the VCS repository. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_workspace_vcs_oauth_token_id"></a> [workspace\_vcs\_oauth\_token\_id](#input\_workspace\_vcs\_oauth\_token\_id) | (Required) The VCS Connection (OAuth Connection + Token) to use. This ID can be obtained from a tfe\_oauth\_client resource. | `string` | n/a | yes |
| <a name="input_workspace_working_directory"></a> [workspace\_working\_directory](#input\_workspace\_working\_directory) | (Required) A relative path that Terraform will execute within. | `string` | n/a | yes |

## Outputs

No outputs.
