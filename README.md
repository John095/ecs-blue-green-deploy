# Blue/Green Deployment on AWS ECS

## Project Overview

This project, based on the AWS Workshop "Blue/Green Deployments on ECS," demonstrates deploying a containerized web application on Amazon Elastic Container Service (ECS) using a blue/green deployment strategy. The application, a simple Nginx web server, was hosted on ECS with Fargate, leveraging AWS CodeDeploy for zero-downtime updates, an Application Load Balancer (ALB) for traffic routing, and Amazon ECR for container storage. The infrastructure was automated using Terraform, ensuring reproducibility and scalability.

## Objectives

- Implement a blue/green deployment to minimize downtime and risk during application updates.
- Deploy a containerized application on ECS with Fargate.
- Automate infrastructure setup and deployment pipeline using Terraform and CodeDeploy.
- Ensure high availability and secure access with VPC and IAM configurations.

## Technologies Used

- **AWS Services**: ECS (Fargate), CodeDeploy, ALB, ECR, VPC, IAM, RDS
- **Tools**: Terraform, Docker, AWS CLI
- **Concepts**: Blue/green deployment, container orchestration, serverless computing, CI/CD

## Architecture

- **VPC**: Configured with public and private subnets across two AZs (`us-east-1a`, `us-east-1b`) for high availability.
- **ECR**: Stored Docker images for the Nginx application.
- **ECS with Fargate**: Ran the application in a serverless ECS cluster with a task definition.
- **ALB**: Managed traffic with two target groups (blue and green) and listeners (port 80 for production, 8080 for testing).
- **CodeDeploy**: Orchestrated blue/green deployments, enabling testing and traffic switching.
- **S3**: Stored the AppSpec file for CodeDeploy.

## Implementation Steps

1. **VPC Setup**: Created a VPC with public/private subnets, an Internet Gateway, and route tables.
2. **ECR Configuration**: Built and pushed a Dockerized Nginx application to an ECR repository.
3. **ECS Cluster**: Deployed an ECS cluster with a Fargate task definition for the application.
4. **ALB Setup**: Configured an ALB with blue and green target groups and listeners for production and test traffic.
5. **CodeDeploy**: Set up a CodeDeploy application and deployment group for blue/green deployment, using an AppSpec file.
6. **Service Deployment**: Launched an ECS service with blue/green deployment enabled, linked to the ALB.
7. **Testing and Deployment**: Tested the green environment via the ALB test listener, then switched traffic to the green environment using CodeDeploy.
8. **Automation**: Used Terraform to automate infrastructure provisioning and streamline deployments.

## Challenges and Solutions

- **Challenge**: Ensuring zero-downtime deployments.
  - **Solution**: Leveraged CodeDeploy’s blue/green strategy to test the green environment before switching traffic.
- **Challenge**: Managing test and production traffic.
  - **Solution**: Configured ALB with separate listeners (port 80 for blue, 8080 for green).
- **Challenge**: Automating complex infrastructure.
  - **Solution**: Used Terraform to define and deploy all resources reproducibly.

## Outcome

The project resulted in a scalable, containerized web application on ECS Fargate with a blue/green deployment pipeline. Updates were deployed with zero downtime by testing the green environment and switching traffic via CodeDeploy. The Terraform automation ensured consistent infrastructure setup.

## Key Learnings

- Mastered blue/green deployment for containerized applications.
- Gained expertise in ECS Fargate and CodeDeploy for automated deployments.
- Learned to secure and scale AWS architectures with VPC, IAM, and ALB.
- Developed skills in infrastructure-as-code with Terraform.

## Live Demo

- **Application URL**: [Insert ALB DNS from deployment]
- **ECR Repository**: [Insert ECR URL from deployment]
- **Source Code**: [Link to Terraform/Docker repository, if applicable]
