# Netic EFS Module

## Supported Terraform Versions

Terraform 0.12

## Usage

```hcl
module "efs" {
  source  = "github.com/neticdk/tf-aws-efs"

  name               = "data"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = [module.vpc.private_subnets]
  security_group_ids = [module.efs_sg.this_security_group_id]
}
```

<!---BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK--->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| encrypted | Encrypt filesystem | bool | `"true"` | no |
| name | File system name | string | n/a | yes |
| security\_group\_ids | Security group ids of security groups that control access to mount targets | list | n/a | yes |
| subnet\_ids | Subnet IDs to create EFS mount targets on | list | n/a | yes |
| tags | A map of tags to add to all resources | map | `<map>` | no |
| vpc\_id | VPC to create EFS file systems in | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mount\_target\_dns\_name |  |

<!---END OF PRE-COMMIT-TERRAFORM DOCS HOOK--->

# Copyright
Copyright (c) 2019 Netic A/S. All rights reserved.

# License
MIT Licened. See LICENSE for full details.

