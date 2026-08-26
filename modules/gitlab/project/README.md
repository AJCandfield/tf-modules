# project module

Creates and configures a GitLab project with portfolio defaults and visibility settings.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.8 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >= 18.0, < 19.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 18.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_issues_enabled"></a> [issues\_enabled](#input\_issues\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_merge_requests_enabled"></a> [merge\_requests\_enabled](#input\_merge\_requests\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | GitLab project display name. | `string` | n/a | yes |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | GitLab namespace ID. Required when this module is used. | `number` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | GitLab project URL path. | `string` | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | `set(string)` | `[]` | no |
| <a name="input_visibility_level"></a> [visibility\_level](#input\_visibility\_level) | n/a | `string` | `"public"` | no |
| <a name="input_wiki_enabled"></a> [wiki\_enabled](#input\_wiki\_enabled) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | GitLab project ID. |
| <a name="output_web_url"></a> [web\_url](#output\_web\_url) | GitLab project URL. |
<!-- END_TF_DOCS -->
