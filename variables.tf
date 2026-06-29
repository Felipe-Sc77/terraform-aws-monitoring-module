variable "project_name" {
  description = "Nombre del proyecto usado para nombrar recursos."
  type        = string
}

variable "environment" {
  description = "Ambiente del despliegue, por ejemplo dev."
  type        = string
}

variable "alb_arn_suffix" {
  description = "Sufijo ARN del ALB usado por las métricas de CloudWatch."
  type        = string
}

variable "target_group_arn_suffix" {
  description = "Sufijo ARN del Target Group usado por las métricas de CloudWatch."
  type        = string
}

variable "asg_name" {
  description = "Nombre del Auto Scaling Group de la capa de aplicación."
  type        = string
}

variable "db_instance_id" {
  description = "Identificador de la instancia RDS."
  type        = string
}

variable "cpu_threshold" {
  description = "Umbral de CPU para la alarma del ASG/EC2."
  type        = number
  default     = 70
}

variable "rds_cpu_threshold" {
  description = "Umbral de CPU para la alarma de RDS."
  type        = number
  default     = 70
}

variable "unhealthy_hosts_threshold" {
  description = "Cantidad de targets no saludables que dispara la alarma del ALB."
  type        = number
  default     = 1
}

variable "common_tags" {
  description = "Tags comunes para aplicar a los recursos."
  type        = map(string)
  default     = {}
}
