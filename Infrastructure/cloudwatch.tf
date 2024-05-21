# Alarm For Redirect URL
module "redirct_url_alarm" {
  source       = "./modules/cloudwatch"
  depends_on   = [module.send_mail_redirect]
  name         = "redirect_url_alarm"
  evaluation   = 1
  period       = 60
  comparison   = "GreaterThanOrEqualToThreshold"
  threshold    = 5
  statistic    = "Sum"
  namespace    = "AWS/ApplicationELB"
  metric       = "HTTPCode_Target_3XX_Count"
  description  = "Sending email whenever there's redirect url is higher"
  alarm_action = [module.send_mail_redirect.arn]
  dimensions = {
    LoadBalancer = module.harshvardhan-alb.arn_suffix
  }
}

# Alarm For 5XX Errors.
module "bad_request_alarm" {
  source       = "./modules/cloudwatch"
  depends_on   = [module.send_mail_redirect]
  name         = "503_Temporary"
  evaluation   = 1
  period       = 60
  comparison   = "GreaterThanOrEqualToThreshold"
  threshold    = 5
  statistic    = "Sum"
  namespace    = "AWS/ApplicationELB"
  metric       = "HTTPCode_ELB_5XX_Count"
  description  = "Sending email whenever there's service unavailable temporary"
  alarm_action = [module.send_mail_redirect.arn]
  dimensions = {
    LoadBalancer = module.harshvardhan-alb.arn_suffix
  }
}
