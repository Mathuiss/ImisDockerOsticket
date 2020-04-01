client=$1

echo "CREATE DATABASE ${client}_ost;" | mysql -u root
echo "CREATE USER '${client}_admin'@'%' IDENTIFIED BY '${client}_admin';" | mysql -u root
echo "GRANT USAGE ON *.* TO '${client}_admin'@'%' IDENTIFIED BY '${client}_admin';" | mysql -u root
echo "GRANT ALL privileges ON ${client}_ost.* TO '${client}_admin'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
