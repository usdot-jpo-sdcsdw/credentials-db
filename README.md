# Connected Vehicles Credentials Database

The Connected Vehicles Credentials Database project contains a docker image which 
runs a MySQL database, but also will create the necessary tables for storing
the credentials used by the Single Sign-On server.

<a name="toc"/>

## Table of Contents

[I. Release Notes](#release-notes)

[II. Documentation](#documentation)

[III. Getting Started](#getting-started)

[IV. Running the Application](#running)

---

<a name="release-notes" id="release-notes"/>

## [I. Release Notes](ReleaseNotes.md)

<a name="documentation"/>

## II. Documentation

This repository produces a Docker image which when run, will create the necessary tables an expose a MySQL database.

For information on configuring the MySQL database itself, see the [documentation for the underlying image](https://hub.docker.com/_/mysql/)

The database contains two tables:

* Users table: Contains a Username and Password-MD5 column
* Admins table: Contains a Username column. Users in the Users table which appear in this table are considered administrators.

<a name="getting-started"/>

## III. Getting Started

The following instructions describe the procedure to fetch, build, and run the application

### Prerequisites
* Git: https://git-scm.com/
* Docker: https://docs.docker.com/engine/installation/

---
### Obtain the Source Code

#### Step 1 - Clone public repository

Clone the source code from the GitHub repository using Git command:

```bash
git clone TBD
```

<a name="running"/>

## IV. Running the application

---
### Build and Deploy the Application

**Step 1**: Build Docker Image

```bash
docker build -t dotcv/credentials-db .
```

**Step 2**: Run Docker Container

In addition to the variables expected by the underlying MySQL image, the following
variables are available to configure the image:

* USERS_TABLE_NAME - Name of table which stores credentials. Defaults to "users".
* ADMINS_TABLE_NAME - Name of table which stores which users are administrators. Defaults to "admins".
* USERNAME_COLUMN_NAME - Name of column (for both tables) which stores user names. Defaults to "username".
* USERNAME_COLUMN_TYPE - SQL type of user names. Defaults to "char(128)".
* PASSWORD_COLUMN_NAME - Name of column which stores password MD5's. Defaults to "password".
* PASSWORD_COLUMN_TYPE - SQL type of passwords. Defaults to "char(64)".

```bash
docker run \
    -e MYSQL_DATABASE=... \
    -e MYSQL_ROOT_PASSWORD=... \
    -e USERS_TABLE_NAME=... \
    -e ADMINS_TABLE_NAME=... \
    -e USERNAME_COLUMN_NAME=... \
    -e USERNAME_COLUMN_TYPE=... \
    -e PASSWORD_COLUMN_NAME=... \
    -e PASSWORD_COLUMN_TYPE=... \
    dotcv/credentials-db
```


</a>