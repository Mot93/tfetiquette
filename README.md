# TFEtiquette

After years of working with terraform this example showcases all the best practice I have adopted.

## Prerequisite

1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Install taskfile](https://taskfile.dev/docs/guide)

## Taskfiles

[Taskfiles](https://taskfile.dev/docs/guide) are amazing tool for automation.

I found them particularly usefull when working with other peoples because it's a tool present on any system and comes out of the box with plenty of features.

It's particularly usefull to have always the have predictable outputs, this works particularly well with `.gitignore`.

## Shared variables

There 2 main ways to schare a value bween environments.

1. Having a file that they both can access.
    This is gread when sharing basic and public configurations.
2. Reading another terraform state to make sure that all are alligned.
    Particularly usefull when sharing the outputs of one or more resources between environments.
