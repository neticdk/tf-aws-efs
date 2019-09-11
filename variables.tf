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

variable "monitoring_enabled" {
  description = "True if monitoring of this filesystem should be enabled"
  type        = bool
  default     = false
}

variable "disk_space_kb_error_threshold" {
  description = "Maximum disk space threshold in kilobytes"
  type        = string
  default     = 10485760 // 10GB
}

variable "sns_topic" {
  description = "ARN of SNS topic"
  type        = string
}¬
