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

output "blue_service_name" {
  value = aws_ecs_service.blue.name
}

output "green_service_name" {
  value = aws_ecs_service.green.name
}

output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}

output "production_url" {
  value = "http://${aws_lb.main.dns_name}"
}

output "staging_url" {
  value = "http://${aws_lb.main.dns_name}:8080"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "codepipeline_name" {
  value = aws_codepipeline.app_pipeline.name
}

