# repository module

Creates and configures a GitHub repository with portfolio defaults, topics, merge policy, and secret scanning settings.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version       |
| ------------------------------------------------------------------------ | ------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.15.8     |
| <a name="requirement_github"></a> [github](#requirement_github)          | >= 6.0, < 7.0 |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_github"></a> [github](#provider_github) | 6.13.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                 | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)               | resource |

## Inputs

| Name                                                                                                                              | Description                                                                                 | Type          | Default    | Required |
| --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------- | ---------- | :------: |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input_allow_auto_merge)                                               | Allow pull requests to be merged automatically when branch protection requirements are met. | `bool`        | `true`     |    no    |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input_allow_merge_commit)                                         | Allow pull requests to be merged with a merge commit.                                       | `bool`        | `false`    |    no    |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input_allow_rebase_merge)                                         | Allow pull requests to be merged with a rebase merge.                                       | `bool`        | `false`    |    no    |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input_allow_squash_merge)                                         | Allow pull requests to be merged with a squash merge.                                       | `bool`        | `true`     |    no    |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input_delete_branch_on_merge)                            | Automatically delete the head branch after a pull request is merged.                        | `bool`        | `true`     |    no    |
| <a name="input_description"></a> [description](#input_description)                                                                | Repository description.                                                                     | `string`      | `null`     |    no    |
| <a name="input_has_discussions"></a> [has\_discussions](#input_has_discussions)                                                   | Enable GitHub Discussions for the repository.                                               | `bool`        | `false`    |    no    |
| <a name="input_has_issues"></a> [has\_issues](#input_has_issues)                                                                  | Enable GitHub Issues.                                                                       | `bool`        | `true`     |    no    |
| <a name="input_has_projects"></a> [has\_projects](#input_has_projects)                                                            | Enable GitHub Projects for the repository.                                                  | `bool`        | `false`    |    no    |
| <a name="input_has_wiki"></a> [has\_wiki](#input_has_wiki)                                                                        | Enable the repository wiki.                                                                 | `bool`        | `false`    |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                     | Repository name.                                                                            | `string`      | n/a        |   yes    |
| <a name="input_secret_scanning"></a> [secret\_scanning](#input_secret_scanning)                                                   | Enable GitHub secret scanning where supported.                                              | `bool`        | `true`     |    no    |
| <a name="input_secret_scanning_push_protection"></a> [secret\_scanning\_push\_protection](#input_secret_scanning_push_protection) | Block pushes containing detected secrets where supported.                                   | `bool`        | `true`     |    no    |
| <a name="input_topics"></a> [topics](#input_topics)                                                                               | Topics to apply to the repository.                                                          | `set(string)` | `[]`       |    no    |
| <a name="input_visibility"></a> [visibility](#input_visibility)                                                                   | Repository visibility.                                                                      | `string`      | `"public"` |    no    |

## Outputs

| Name                                                            | Description                |
| --------------------------------------------------------------- | -------------------------- |
| <a name="output_full_name"></a> [full\_name](#output_full_name) | Repository owner and name. |
| <a name="output_html_url"></a> [html\_url](#output_html_url)    | Repository URL.            |
| <a name="output_name"></a> [name](#output_name)                 | Repository name.           |

<!-- END_TF_DOCS -->
