# Restart container 
NAME=snode

docker container start $NAME
docker attach $NAME
