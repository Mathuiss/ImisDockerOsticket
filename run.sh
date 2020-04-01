#! /bin/bash
name=$1
port=$2

docker rm -f ${name}-osticket

docker run -itd --name ${name}-osticket -e MYSQL_HOST=172.17.0.1 -e MYSQL_USER=${name}_admin -e MYSQL_PASSWORD=${name}_admin -e MYSQL_DATABASE=${name}_ost -e INSTALL_CONFIG=/data/bin/imis-config.php -p ${port}:80 -v ${name}-ost-upload:/data/upload -v ${name}-ost-log:/var/log/nginx ${name}-osticket-image
docker ps

chown -R root:root /var/lib/docker/volumes
echo ""
echo "[osticket container ip]"
docker exec osticket ifconfig
