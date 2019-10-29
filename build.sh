
docker stop osticket
docker rmi dev-osticket-image
rm -rf /var/lib/docker/volumes/osticket-upload-volume/_data/*
docker build -t dev-osticket-image .
