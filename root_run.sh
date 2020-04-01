echo $1 $2

client=$1
port=$2

./build.sh $client
./set_db.sh $client
./set_nginx.sh $client $port
./run.sh $client $port
