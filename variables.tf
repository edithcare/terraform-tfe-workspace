variable "workspace_name" {
  type        = string
  description = "(Required) Name of the workspace."
}

variable "workspace_org" {
  type        = string
  description = "(Required) Name of the organization."
  default     = "edithcare"
}

variable "workspace_auto_apply" {
  type        = bool
  description = "(Required) Whether destroy plans can be queued on the workspace."
}

variable "workspace_file_triggers_enabled" {
  type        = bool
  description = "(Optional) Whether to filter runs based on the changed files in a VCS push."
  default     = true
}

variable "workspace_queue_all_runs" {
  type        = bool
  description = "(Optional) Whether the workspace should start automatically performing runs immediately after its creation."
  default     = false
}

variable "workspace_terraform_version" {
  type        = string
  description = "(Required) The version of Terraform to use for this workspace."
}

variable "workspace_working_directory" {
  type        = string
  description = "(Required) A relative path that Terraform will execute within."
}

variable "workspace_vcs_branch" {
  type        = string
  description = "(Optional) repository branch that Terraform will execute from. Default to `master`"
  default     = "master"
}

variable "workspace_trigger_prefixes" {
  type        = list(string)
  description = "(Optional) List of repository-root-relative paths which describe all locations to be tracked for changes"
  default     = []
}

variable "workspace_allow_destroy_plan" {
  type        = bool
  description = "(Optional) Whether destroy plans can be queued on the workspace."
  default     = true
}

variable "workspace_vcs_identifier" {
  type        = string
  description = "(Required) A reference to your VCS repository in the format <organization>/<repository> where <organization> and <repository> refer to the organization and repository in your VCS provider."
}

variable "workspace_vcs_ingress_submodules" {
  type        = bool
  description = "(Optional) Whether submodules should be fetched when cloning the VCS repository. Defaults to `false`."
  default     = false
}

variable "workspace_vcs_oauth_token_id" {
  type        = string
  description = "(Required) The VCS Connection (OAuth Connection + Token) to use. This ID can be obtained from a tfe_oauth_client resource."
}

variable "team_access" {
  type = list(object({
    name   = string
    id     = string
    access = string
  }))
  description = "value"
  default     = []
}

variable "slack_enabled" {
  type        = bool
  description = "value"
  default     = false
}

variable "slack_url" {
  type        = string
  description = "value"
}

variable "slack_triggers" {
  type        = list(string)
  description = "value"
  default = [
    "run:created",
    "run:completed",
    "run:errored",
    "run:needs_attention",
  ]
}

variable "tf_variables" {
  type = list(object({
    category    = string
    name        = string
    value       = string
    sensitive   = optional(bool)
    hcl         = optional(bool)
    description = optional(string)
  }))
  description = "value"
  default     = []
}
