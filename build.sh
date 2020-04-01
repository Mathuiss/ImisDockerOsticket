name=$1

docker stop ${name}-osticket
docker rmi ${name}-osticket-image
rm -rf /var/lib/docker/volumes/${name}-ost-upload/_data/*
docker build -t ${name}-osticket-image .
