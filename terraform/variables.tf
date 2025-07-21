variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "monolith-app"
}

variable "db_username" {
  description = "PostgreSQL DB username"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL DB password"
  type        = string
  sensitive   = true
}

variable "app_image_url" {
  description = "Docker image URL for the app"
  type        = string
}

variable "database_url" {
  description = "DATABASE_URL for Prisma"
  type        = string
}
variable "db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "app_db"
}
