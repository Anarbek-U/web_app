!#/bin/bash

docker network ls | grep service_net > /dev/null 2>&1 || docker network create service_net
docker rm -f web db cache > /dev/null 2>&1 || true
docker run -d --name db -v pgdata:/var/lib/postgresql/data --network service_net --env-file .env_db postgres:16
docker run -d --name cache --network service_net redis
docker run -d --name web --network service_net -p 8080:8080 --env-file .env_web myapp:v1 
