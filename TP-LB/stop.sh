docker stop nginx1
docker stop nginx2
docker stop nginx-lb

docker rm -f nginx1
docker rm -f nginx2
docker rm -f nginx-lb

docker network rm tplb
