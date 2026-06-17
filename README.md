# :game_die: Lua D20 dice rolling application

In this project, I detail the steps taken (1) containerise an application with **Docker**, (2) implement a simple CI/CD pipeline with **GitHub Actions**, and (3) deploy it on **Azure**.

## Table of Contents

- [Create application](#create-application)
- [Containerisation](#containerisation)
- [CI/CD pipeline](#cicd-pipeline)
- [Deployment](#deployment)

## :pencil: Create application 

I used Lua to build a simple D20 dice rolling application that runs in the terminal, which basically generated a random integer between 1 and 20 (inclusive of both values), using `math.random()`

To roll the dice, you will be instructed to press `ENTER`, which was enabled with `io.read()`. For the dice to roll multiple times without having to exit the application, I nested the `io.read()` command within a `while` loop, with an option to exit gracefully by typing `q`.

## :whale: Containerisation

Next, I containerised the application using Docker. This helped build the image, install the dependencies, and defined the commmand that runs the application.

The Dockerfile contains the following:
```
# syntax=docker/dockerfile:1

FROM fedora:latest
WORKDIR /app
COPY . .
RUN dnf install -y lua luarocks
CMD ["lua", "lua/main.lua"]
```

I ran the following in the terminal to build the Docker image:
```
docker build -t d20 .
```

To verify that the application is running properly within the container, I ran
```
docker run -it d20
```

Since `io.read()` was used to roll the dice, `-i` is essential for the application to run.

To inspect the image, I ran
```
docker images
```
which gave the output
```
IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
d20:latest           d7c20df3537c        789MB          236MB    U   
```

To view the running containers, I ran
```
docker ps
```
which gave the output
```
CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS         PORTS     NAMES
0e8aaece8075   d20       "lua lua/main.lua"   6 seconds ago   Up 5 seconds             goofy_germain

```

## :wrench: CI/CD Pipeline

I created a GitHub Actions workflow was created to automatically build the Docker image whenever code is pushed to the `main` branch or a pull request is opened. The workflow executes on an Ubuntu runner and performs the following steps:

1. Checks out the repository.
2. Builds the Docker image using the Dockerfile.
3. Reports the build status through the GitHub Actions interface.

The yaml file contains the following:
```
name: Docker Image CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:

  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4
    - name: Build the Docker image
      run: docker build -t d20 .

```

## :cloud: Deployment

I then deployed the application on Microsoft Azure, using their Container Register. First, I created a new contained register resource and resource group for the image to be pushed. Then, I created a new client secret in order to authentical with Azure during GitHub Actions.


in github actions:

push image to azure container register
deploy image