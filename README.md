# Full-Stack Blog with Next.js and Blue-Green Deployment on AWS ECS

## Project Overview
This project is a full-stack blog application built with **Next.js** (App Router, TypeScript), **Prisma**, and a **PostgreSQL** database, styled with **Tailwind CSS**, and deployed to **AWS ECS Fargate** using a **blue-green deployment** strategy with **GitHub Actions**. The application allows users to create and view blog posts, with data stored in a PostgreSQL database running locally in a **Docker** container during development. For production, the app is deployed to AWS ECS with zero-downtime updates, leveraging two target groups (blue and green) and an Application Load Balancer (ALB). The project demonstrates modern full-stack development, containerization, and advanced DevOps practices for scalable, reliable deployments.

**Repository**: [github.com/John095/ecs-blue-green-deploy](https://github.com/John095/ecs-blue-green-deploy)

## Objectives
- Build a functional blog with CRUD operations for posts using Next.js App Router and TypeScript.
- Integrate a local PostgreSQL database using Docker and Prisma for development.
- Create a responsive, modern UI with Tailwind CSS.
- Deploy the application to AWS ECS Fargate with a blue-green deployment pipeline for zero-downtime updates.
- Showcase skills in full-stack development, DevOps, and cloud infrastructure.

## Technologies Used
- **Frontend/Backend**: Next.js (App Router), React, TypeScript
- **Database**: PostgreSQL (Docker for local, managed service for production), Prisma
- **Styling**: Tailwind CSS
- **DevOps**: Docker, AWS ECS Fargate, Application Load Balancer, GitHub Actions
- **Infrastructure**: AWS (ECR, ECS, ALB), Terraform or CloudFormation (based on repo setup)
- **Concepts**: Full-stack development, ORM, containerization, CI/CD, blue-green deployment, type safety, responsive design

## Architecture
- **Local Development**:
  - **PostgreSQL**: Hosted in a Docker container via Docker Compose, running on `localhost:5432`.
  - **Prisma**: ORM for managing the `Post` model and database interactions.
  - **Next.js**: App Router for API routes (`/api/posts`) and client-side rendering of the blog UI (post list and creation form).
  - **Tailwind CSS**: Utility-first styling for a responsive, modern interface.
- **Production Deployment**:
  - **AWS ECS Fargate**: Hosts the Next.js application in Docker containers.
  - **Blue-Green Deployment**: Two ECS services (blue and green) with separate target groups behind an ALB. Traffic shifts from blue (production) to green (new version) after validation.
  - **GitHub Actions**: CI/CD pipeline builds the Docker image, pushes it to AWS ECR, updates the ECS task definition, and swaps target groups for zero-downtime deployment.
  - **PostgreSQL**: Managed database (e.g., AWS RDS or Supabase) for production data storage.

<!-- ![Architecture Diagram](architecture-diagram.png)
*Diagram showing local Docker setup and AWS ECS blue-green deployment pipeline* -->

## Implementation Steps
1. **Local Setup**:
   - Configured a PostgreSQL container with Docker Compose for local development.
   - Defined a Prisma `Post` model and applied migrations to create the database schema.
   - Built a Next.js app with TypeScript, including API routes (`/api/posts`) for CRUD operations and a homepage for post creation and display.
   - Styled the UI with Tailwind CSS for a responsive, user-friendly experience.
   - Tested locally at `http://localhost:3000` with Dockerized PostgreSQL.

2. **AWS ECS Deployment**:
   - Created a Docker image for the Next.js app and pushed it to AWS ECR.
   - Set up an ECS cluster with Fargate, two target groups (blue and green), and an ALB for traffic routing.
   - Configured a GitHub Actions pipeline to automate building, pushing, and deploying the app, with a manual review step for blue-green traffic switching.
   - Integrated a managed PostgreSQL database (e.g., AWS RDS) for production, updating the `DATABASE_URL` in environment variables.

3. **Blue-Green Deployment**:
   - Used AWS ECS with an external controller (GitHub Actions) to manage task sets and target group swaps, inspired by [aws-samples/ecs-blue-green-deployment](https://github.com/aws-samples/ecs-blue-green-deployment).
   - Implemented zero-downtime deployment by testing the green environment on a separate ALB port (e.g., 8080) before swapping traffic to production (port 80).
   - Ensured rollback capabilities by maintaining the blue environment until the green deployment is validated.

4. **Testing**:
   - Validated local development with `psql` to query the PostgreSQL database and `curl` to test API routes.
   - Tested production deployment by accessing the ALB DNS URL and verifying traffic switching during blue-green deployments.

## Challenges and Solutions
- **Challenge**: Setting up a local PostgreSQL database without a managed service.
  - **Solution**: Used Docker Compose to run PostgreSQL locally, simplifying setup and ensuring portability.
- **Challenge**: Ensuring zero-downtime deployments on ECS.
  - **Solution**: Implemented a blue-green deployment pipeline with GitHub Actions, using two target groups and an ALB to switch traffic seamlessly.
- **Challenge**: Debugging database connectivity issues in local development (posts not saving).
  - **Solution**: Installed `psql` client, verified Prisma migrations, and tested API routes with `curl` to ensure data persistence.
- **Challenge**: Managing TypeScript types in Next.js App Router.
  - **Solution**: Defined a `Post` interface and used proper typing for API routes and components, ensuring type safety.

## Outcome
The project resulted in a fully functional blog application, runnable locally with Docker and deployed to AWS ECS Fargate with a robust blue-green deployment pipeline. Users can create and view posts, with data persisted in PostgreSQL (local or managed). The CI/CD pipeline ensures zero-downtime updates, making the application scalable and reliable. The project showcases expertise in full-stack development, cloud infrastructure, and modern DevOps practices.

## Key Learnings
- Mastered Next.js App Router with TypeScript for type-safe full-stack development.
- Gained expertise in Prisma for ORM-based database interactions and Docker for local database management.
- Learned to implement blue-green deployments on AWS ECS Fargate with GitHub Actions for zero-downtime updates.
- Developed skills in responsive design with Tailwind CSS and CI/CD pipeline automation.

## Live Demo
- **Local URL**: [http://localhost:3000](http://localhost:3000) (when running locally)
- **Production URL**: [ALB DNS URL, e.g., http://<alb-dns>.us-east-1.elb.amazonaws.com] (if deployed)
- **Source Code**: [github.com/John095/ecs-blue-green-deploy](https://github.com/John095/ecs-blue-green-deploy)

<!-- ![Blog Screenshot](blog-screenshot.png)
*Screenshot of the blog UI showing post list and creation form* -->

*Built as a full-stack project to demonstrate Next.js, TypeScript, Prisma, PostgreSQL, Docker, and AWS ECS blue-green deployment*