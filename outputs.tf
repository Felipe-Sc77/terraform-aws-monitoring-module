output "alb_unhealthy_hosts_alarm_name" {
  description = "Nombre de la alarma de targets no saludables del ALB."
  value       = aws_cloudwatch_metric_alarm.alb_unhealthy_hosts.alarm_name
}

output "asg_cpu_alarm_name" {
  description = "Nombre de la alarma de CPU alta del ASG/EC2."
  value       = aws_cloudwatch_metric_alarm.asg_cpu_high.alarm_name
}

output "rds_cpu_alarm_name" {
  description = "Nombre de la alarma de CPU alta de RDS."
  value       = aws_cloudwatch_metric_alarm.rds_cpu_high.alarm_name
}
