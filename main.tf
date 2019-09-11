/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

locals {
  tags = {
    Terraform = "true"
  }

  all_tags = merge(var.tags, local.tags)
}

resource "aws_efs_file_system" "this" {
  encrypted = var.encrypted

  tags = merge(
    {
      "Name" = var.name
    },
    local.all_tags,
  )
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnet_ids)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = element(var.subnet_ids, count.index)
  security_groups = var.security_group_ids
}

resource "aws_cloudwatch_metric_alarm" "this" {
  count = var.monitoring_enabled ? 1 : 0

  alarm_name                = "${var.name} disk space exceeded"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "EFS Size"
  namespace                 = "EFS Metrics"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.disk_space_kb_error_threshold

  dimensions = {
    EFS_Name = var.name
  }

  alarm_description         = "zd=${var.name} zs=error | disk space exceeded"
  alarm_actions             = [var.sns_topic]
  ok_actions                = [var.sns_topic]

  insufficient_data_actions = []
}
