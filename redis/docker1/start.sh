#initialisation
docker stop $(docker ps -q)
docker rm $(docker ps -aq) #supression de tout les dockers

docker network create myredis #création du réseau virtuelle et des images
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .

docker run -d \
	--network myredis \
	--name s_redis \
	redis:latest

docker run -d \
	--network myredis \
	--name s_cons \
	img_cons
docker run -d \
	--network myredis \
	--name s_prod \
	img_prod
