NAME=snode
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME

