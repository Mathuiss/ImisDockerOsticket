
docker stop osticket
docker rmi osticket-image
rm -rf /var/lib/docker/volumes/osticket-upload-volume/_data/*
docker build -t osticket-image .
