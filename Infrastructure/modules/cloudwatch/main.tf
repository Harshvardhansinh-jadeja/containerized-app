resource "aws_cloudwatch_metric_alarm" "gen_cloudwatch" {
  alarm_name          = var.name
  comparison_operator = var.comparison
  evaluation_periods  = var.evaluation
  metric_name         = var.metric
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = var.description
  alarm_actions       = var.alarm_action
  dimensions          = var.dimensions
}