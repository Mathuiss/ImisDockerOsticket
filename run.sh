docker run -itd --rm --name osticket -e MYSQL_HOST=172.17.0.1 -e MYSQL_USER=imis_admin -e MYSQL_PASSWORD=imis_admin -e MYSQL_DATABASE=ost_db -e INSTALL_CONFIG=/data/bin/imis-config.php -p 800:80 -v osticket-upload-volume:/data/upload -v osticket-log-volume:/var/log/nginx dev-osticket-image

chown -R ftp:root /var/lib/docker/volumes
