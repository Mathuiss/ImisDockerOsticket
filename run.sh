#! /bin/bash
docker rm -f osticket

docker run -itd --name osticket -e MYSQL_HOST=172.17.0.1 -e MYSQL_ROOT_PASSWORD=iMIS2008! -e MYSQL_USER=imis_admin -e MYSQL_PASSWORD=imis_admin -e MYSQL_DATABASE=ost_db -e INSTALL_CONFIG=/data/bin/imis-config.php -p 800:80 -v osticket-upload-volume:/data/upload -v osticket-log-volume:/var/log/nginx osticket-image
docker ps

chown -R ftp:root /var/lib/docker/volumes
echo ""
echo "[osticket container ip]"
docker exec osticket ifconfig
