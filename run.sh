docker rm -f osticket-db
docker rm -f osticket

docker run -itd --name osticket-db -e MYSQL_ROOT_PASSWORD=iMIS2008! -e MYSQL_USER=imis_admin -e MYSQL_PASSWORD=imis_admin -e MYSQL_DATABASE=ost_db mysql:5
docker ps

docker run -itd --name osticket --link osticket-db:mysql -e MYSQL_ROOT_PASSWORD=iMIS2008! -e MYSQL_USER=imis_admin -e MYSQL_PASSWORD=imis_admin -e MYSQL_DATABASE=ost_db -e INSTALL_CONFIG=/data/bin/imis-config.php -p 800:80 -v osticket-upload-volume:/data/upload -v osticket-log-volume:/var/log/nginx osticket-image
docker ps

chown -R ftp:root /var/lib/docker/volumes

sleep 10
docker ps

docker rm osticket-db
docker run -itd --name osticket-db -e MYSQL_ROOT_PASSWORD=iMIS2008! -e MYSQL_USER=imis_admin -e MYSQL_PASSWORD=imis_admin -e MYSQL_DATABASE=ost_db mysql:5
docker ps

echo "[osticket]"
docker exec osticket ifconfig
