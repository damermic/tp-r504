docker rm $(docker ps -aq)
docker volume prune
docker system prune
