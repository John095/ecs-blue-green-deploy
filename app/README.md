# Simple Blog with Next.js App Router, Prisma, and PostgreSQL

## Project Overview
This project is a simple blog application built with **Next.js** (using the App Router and TypeScript), **Prisma**, and a **PostgreSQL** database running locally in a Docker container, styled with **Tailwind CSS**. The blog allows users to view a list of posts and create new ones via a form, with data persisted in PostgreSQL and managed through Prisma's ORM. The project demonstrates modern full-stack development with TypeScript, containerization, and responsive design in a local environment.

## Objectives
- Build a functional blog with CRUD operations for posts using Next.js App Router.
- Integrate a local PostgreSQL database with Prisma and Docker.
- Create a responsive UI with Tailwind CSS.
- Leverage TypeScript for type-safe development.

## Technologies Used
- **Frontend/Backend**: Next.js (App Router), React, TypeScript
- **Database**: PostgreSQL (Docker), Prisma
- **Styling**: Tailwind CSS
- **Tools**: Docker, Docker Compose, Node.js
- **Concepts**: Full-stack development, ORM, containerization, type safety, responsive design

## Architecture
- **PostgreSQL**: Hosted locally in a Docker container via Docker Compose.
- **Prisma**: ORM for interacting with the PostgreSQL database, managing a `Post` model.
- **Next.js**: Uses App Router for API routes (`/api/posts`) and client-side rendering of the blog UI.
- **Tailwind CSS**: Provides utility-first styling for a clean, responsive interface.

## Implementation Steps
1. **Docker Setup**: Configured a PostgreSQL container with Docker Compose, exposing port 5432.
2. **Prisma Configuration**: Defined a `Post` model and connected to PostgreSQL via Prisma.
3. **Next.js Development**: Built a Route Handler (`/api/posts`) for CRUD operations and a homepage to display posts and a creation form, all in TypeScript.
4. **Tailwind CSS**: Integrated Tailwind for responsive styling of the blog UI.
5. **Testing**: Ran the application locally, tested post creation, and verified data persistence in PostgreSQL.

## Challenges and Solutions
- **Challenge**: Setting up Next.js App Router with TypeScript.
  - **Solution**: Used TypeScript with proper type definitions for API routes and components.
- **Challenge**: Running a local database without managed services.
  - **Solution**: Used Docker Compose for a portable PostgreSQL setup.
- **Challenge**: Creating a responsive UI efficiently.
  - **Solution**: Leveraged Tailwind CSS for rapid, utility-based styling.

## Outcome
The project resulted in a fully functional blog application running locally, with a type-safe codebase, responsive UI, and persistent data storage. Users can create and view posts, with data managed efficiently by Prisma and PostgreSQL. The Dockerized setup ensures easy setup and reproducibility.

## Key Learnings
- Mastered Next.js App Router with TypeScript for full-stack development.
- Gained expertise in Prisma for ORM-based database interactions.
- Learned to set up and manage a local PostgreSQL database with Docker.
- Developed skills in responsive design with Tailwind CSS.

## Live Demo
- **Local URL**: http://localhost:3000 (when running locally)
- **Source Code**: [Link to GitHub repository, if applicable]

*Built as a local full-stack project to demonstrate Next.js App Router, TypeScript, Prisma, and PostgreSQL integration*