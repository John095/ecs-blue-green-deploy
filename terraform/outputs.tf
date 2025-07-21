output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "db_instance_endpoint" {
  value = aws_db_instance.postgres.address
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

