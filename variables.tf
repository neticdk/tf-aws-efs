/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "name" {
  description = "File system name"
  type        = string
}

variable "vpc_id" {
  description = "VPC to create EFS file systems in"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs to create EFS mount targets on"
  type        = list
}

variable "security_group_ids" {
  description = "Security group ids of security groups that control access to mount targets"
  type        = list
}

variable "encrypted" {
  description = "Encrypt filesystem"
  type        = bool
  default     = true
}
