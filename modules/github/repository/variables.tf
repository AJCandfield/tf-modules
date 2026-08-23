variable "name" {
  description = "Repository name."
  type        = string
}

variable "description" {
  description = "Repository description."
  type        = string
  default     = null
}

variable "visibility" {
  description = "Repository visibility."
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be public, private, or internal."
  }
}

variable "topics" {
  description = "Topics to apply to the repository."
  type        = set(string)
  default     = []
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "has_projects" {
  type    = bool
  default = false
}

variable "has_wiki" {
  type    = bool
  default = false
}

variable "allow_squash_merge" {
  type    = bool
  default = true
}

variable "allow_merge_commit" {
  type    = bool
  default = false
}

variable "allow_rebase_merge" {
  type    = bool
  default = false
}

variable "allow_auto_merge" {
  description = "Allow pull requests to be merged automatically when branch protection requirements are met."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}

variable "secret_scanning" {
  description = "Enable GitHub secret scanning where supported."
  type        = bool
  default     = true
}

variable "secret_scanning_push_protection" {
  description = "Block pushes containing detected secrets where supported."
  type        = bool
  default     = true
}
