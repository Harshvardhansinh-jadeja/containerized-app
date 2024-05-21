resource "aws_sns_topic" "gen_SNS" {
  name         = var.name
  display_name = var.name
}

resource "aws_sns_topic_subscription" "send_mail" {
  topic_arn              = aws_sns_topic.gen_SNS.arn
  protocol               = "email"
  endpoint               = var.email
  endpoint_auto_confirms = true
}