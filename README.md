# :game_die: Lua D20 dice rolling application

In this project, I detail the steps taken (1) containerise an application with **Docker**, (2) implement a simple CI/CD pipeline with **GitHub Actions**, and (3) deploy it on **AWS**.

## Table of Contents

- [Create application](#create-application)
- [Containerisation](#containerisation)
- [CI/CD pipeline](#cicd-pipeline)
- [Deployment](#deployment)

## :pencil: Create application 

I used Lua to build a simple D20 dice rolling application that runs in the terminal, which basically generated a random integer between 1 and 20 (inclusive of both values), using `math.random()`

To roll the dice, you will be instructed to press ENTER, which was enabled with `io.read()`. For the dice to roll multiple times without having to exit the application, I nested the `io.read()` command within a `while` loop, with an option to exit gracefully by typing `q`.

## :whale: Containerisation
Next, I containerised the application using Docker. This helped build the image, install the dependencies, and defined the commmand that runs the application.

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

## :octocat: CI/CD Pipeline

coming soon...

## :cloud: Deployment

coming soon...