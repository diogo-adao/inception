# User Documentation

This document explains how to use and manage the project stack from an end-user or administrator perspective.


## 1. Services Provided

The project stack includes 3 main services:

- **NGINX** – The web server that ensures fast, secure, and reliable access to the website.

- **MariaDB** – The database that stores all application data, including posts, pages, user accounts, and settings.

- **WordPress** – Lets you manage content and control the website through the admin panel.


## 2. Starting and Stopping the Project

To **start** all services:

```bash
make
```

To **stop** all services:

```bash
make down
```


## 3. Accessing the Website and Administration Panel

- **Website:** Open a browser and go to:  
  [https://diolivei.42.fr](https://diolivei.42.fr)  

- **Admin Panel:** Open a browser and go to:  
  [https://diolivei.42.fr/wp-admin](https://diolivei.42.fr/wp-admin)  
  > Use your administrator credentials to log in and manage the website.


## 4. Locating and Managing Credentials

  All credentials are stored in a `.env` file inside the `srcs` folder.  
  > ⚠️ The `.env` file is **not included** in the repository for security reasons. Use the provided template `.env.example` to create your local `.env`.

### Steps to set up credentials:

1. Copy the template:

```bash
cp srcs/.env.example srcs/.env
```

2. Open srcs/.env in a text editor and fill in your own credentials:

- **Admin Panel Credentials:**  
  ```text
  ADMIN_USER=<admin username>
  ADMIN_PWD=<admin password>
  ADMIN_EMAIL=<admin email>
  ```

- **Database Credentials:**  
  ```text
  MARIADB_NAME=<database name>
  MARIADB_USER=<database username>
  MARIADB_PWD=<database password>
  ROOT_PWD=<root password>
  ```

## 5. Checking If Services Are Running Correctly

You can verify that all services are up and working with the following command:

Open a terminal in the project directory and run:

```bash
docker compose -f srcs/docker-compose.yml ps
```

You should see all containers listed with **State: Up**.
