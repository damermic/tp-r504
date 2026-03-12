docker stop $(docker ps -q)
docker rm $(docker ps -aq) #supression de tout les dockers
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .
docker build -t img_scale -f Dockerfile_s .
