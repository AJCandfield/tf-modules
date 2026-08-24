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
  description = "Enable GitHub Issues."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Enable GitHub Projects for the repository."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Enable the repository wiki."
  type        = bool
  default     = false
}

variable "has_discussions" {
  description = "Enable GitHub Discussions for the repository."
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Allow pull requests to be merged with a squash merge."
  type        = bool
  default     = true
}

variable "allow_merge_commit" {
  description = "Allow pull requests to be merged with a merge commit."
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "Allow pull requests to be merged with a rebase merge."
  type        = bool
  default     = false
}

variable "allow_auto_merge" {
  description = "Allow pull requests to be merged automatically when branch protection requirements are met."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "Automatically delete the head branch after a pull request is merged."
  type        = bool
  default     = true
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

variable "required_status_checks" {
  description = "Status-check contexts required before pull requests can merge into main."
  type        = set(string)
  default     = []
}

variable "actions_secrets" {
  description = "GitHub Actions secrets to manage for the repository."
  type        = map(string)
  default     = {}
  sensitive   = true
}
