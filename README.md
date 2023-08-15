# flask-zappa-aws-lambda
Base project for developing a simple API using Flask, Docker, Gunicorn, Zappa and AWS Lambda.

# Getting started

## Dependencies
Install [Docker](https://docs.docker.com/engine/install/) and [docker composer](https://docs.docker.com/compose/install/)

## Create docker image 
```sh
docker compose build
```

## Run project
### In development environment
```shell
docker compose up
```
Entre de URL http://127.0.0.1:3000/ to visit de API.

### Production
To deploy in a Production environment, the image must be built and run with a container orchestrator.