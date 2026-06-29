# Modulo Terraform AWS Monitoring

Este modulo crea alarmas basicas de CloudWatch para monitorear partes principales de la arquitectura del obligatorio.

## Que crea

- Una alarma para detectar targets no saludables en el Target Group del ALB.
- Una alarma para detectar CPU alta en las instancias EC2 administradas por el Auto Scaling Group.
- Una alarma para detectar CPU alta en la instancia RDS.

## Que no crea

Esta primera version no crea SNS, dashboards, logs ni roles IAM. Las alarmas quedan creadas en CloudWatch, pero no envian notificaciones porque todavia no se definio un destino.

## Variables principales

| Variable | Descripcion |
|---|---|
| `project_name` | Nombre del proyecto usado para nombrar recursos. |
| `environment` | Ambiente del despliegue, por ejemplo `dev`. |
| `alb_arn_suffix` | Sufijo ARN del ALB para la metrica de CloudWatch. |
| `target_group_arn_suffix` | Sufijo ARN del Target Group para la metrica de CloudWatch. |
| `asg_name` | Nombre del Auto Scaling Group. |
| `db_instance_id` | Identificador de la instancia RDS. |
| `cpu_threshold` | Umbral de CPU para la alarma del ASG/EC2. Por defecto es `70`. |
| `rds_cpu_threshold` | Umbral de CPU para la alarma de RDS. Por defecto es `70`. |
| `unhealthy_hosts_threshold` | Cantidad de targets no saludables que dispara la alarma del ALB. Por defecto es `1`. |
| `common_tags` | Tags comunes para aplicar a los recursos. |

## Outputs

| Output | Descripcion |
|---|---|
| `alb_unhealthy_hosts_alarm_name` | Nombre de la alarma de targets no saludables del ALB. |
| `asg_cpu_alarm_name` | Nombre de la alarma de CPU alta del ASG/EC2. |
| `rds_cpu_alarm_name` | Nombre de la alarma de CPU alta de RDS. |

## Decisiones

La alarma del ALB usa la metrica `UnHealthyHostCount` de `AWS/ApplicationELB` con las dimensiones del Load Balancer y del Target Group.

La alarma de CPU de la aplicacion usa `CPUUtilization` de `AWS/EC2` con la dimension `AutoScalingGroupName`. Esto permite observar el promedio de las instancias que pertenecen al ASG sin listar instancias individuales.

La alarma de RDS usa `CPUUtilization` de `AWS/RDS` con la dimension `DBInstanceIdentifier`.

En las tres alarmas se usa `treat_missing_data = "notBreaching"` para que la falta temporal de datos no se tome automaticamente como falla.
