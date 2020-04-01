client=$1
port=$2

echo "
server {
        listen 80;
        server_name $client.h2867424.stratoserver.net $client.imisfood.com;

        # Include action list module
        include /etc/nginx/conf.d/imis-docker/actionlist/$client.conf;
}
" > /etc/nginx/conf.d/imis-docker/$client.conf

echo "
location /actionlist/ {
        proxy_pass http://localhost:$port/;
}
" > /etc/nginx/conf.d/imis-docker/actionlist/$client.conf

nginx -t
nginx -s reload
