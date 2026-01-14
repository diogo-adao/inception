*This project has been created as part of the 42 curriculum by diolivei.*

## Description
The Inception project introduces us to Docker.
The goal is to set up a small infrastructure composed of multiple services running in separate Docker containers, all managed by Docker Compose.

This project focuses on understanding how containers work, how services communicate with each other, and how to configure a containerized environment.
The infrastructure includes a web server, a database, and a content management system, all built from custom Docker images.

## Instructions

### Prerequisites
- Docker
- Docker Compose
- .env file with all needed credentials *(check .env.example)*

### Build and run the infrastructure
From the root of the project:
```bash
make
```

### Stop the infrastructure
From the root of the project:
```bash
make down
```

## Resources

### References
- [How to install Docker and Docker Compose](https://docs.docker.com/engine/install/ubuntu/)
- [How to install NGINX](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)
- [How to install Wordpress](https://developer.wordpress.org/cli/commands/core/)
- [How to install MariaDB](https://mariadb.com/docs/server/mariadb-quickstart-guides/installing-mariadb-server-guide)
- [Project guide](https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671)
- [Repository example](https://github.com/Forstman1/inception-42)

### Use of AI
AI tools were used to:
- Get detailed explanations on topics that were difficult to find documented
- Clarify specific doubts during the development of the project

