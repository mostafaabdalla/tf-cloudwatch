locals {
  alarm_metrics = {
    Bounce_Warning = {
      threshold  = 0.05
      name       = "Reputation.BounceRate"
      priority   = "P4"
      alarm_type = "BounceWarning"
    }
    Bounce = {
      threshold  = 0.1
      name       = "Reputation.BounceRate"
      priority   = "P3"
      alarm_type = "Bounce"
    }
    Complaint_Warning = {
      threshold  = 0.001
      name       = "Reputation.ComplaintRate"
      priority   = "P4"
      alarm_type = "ComplaintWarning"
    }
    Complaint = {
      threshold  = 0.005
      name       = "Reputation.ComplaintRate"
      priority   = "P3"
      alarm_type = "Complaint"
    }
    Reject = {
      threshold  = 1
      name       = "Reject"
      priority   = "P3"
      alarm_type = "Reject"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "account_alarms" {
  for_each            = local.alarm_metrics
  alarm_name          = "${each.value.priority}_${var.default_tags.Project}_${var.default_tags.Environment}_${var.resource_type}_${each.value.alarm_type}_${var.resource_id}_${var.remedy_map}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = each.value.name
  namespace           = "AWS/SES"
  period              = 3600
  statistic           = "Sum"
  threshold           = each.value.threshold
  datapoints_to_alarm = 1
  treat_missing_data  = "ignore"
}