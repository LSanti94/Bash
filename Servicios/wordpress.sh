#!/bin/bash

## Check if running as root
if [ "$(id -u)" != "0" ]; then  
	   echo "This script must be run as root" 1>&2  
	      exit 1  
	       fi
sleep 1

## check Current directory  
pwd=$(pwd)

sleep 1

read -p 'wordpress_db_name [wp_db]: ' wordpress_db_name
read -p 'db_root_password [only-alphanumeric]: ' db_root_password
echo

sleep 1

## Update system
apt-get update -y

sleep 1

## Install Apache
sudo apt-get install apache2 apache2-utils -y

sleep 1

systemctl enable --now apache2
    
## Install PHP  
apt-get install php libapache2-mod-php php-mysql -y

sleep 1

## Install MySQL database server  
export DEBIAN_FRONTEND="noninteractive"  
debconf-set-selections <<< "mysql-server mysql-server/root_password password $db_root_password"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $db_root_password"
apt-get install mysql-server mysql-client -y

sleep 1

## Install Latest WordPress
rm /var/www/html/index.*
wget -c http://wordpress.org/latest.tar.gz  
tar -xzvf latest.tar.gz  
rsync -av wordpress/* /var/www/html/  
       
## Set Permissions  
chown -R www-data:www-data /var/www/html/  
chmod -R 755 /var/www/html/

sleep 1

## Configure WordPress Database  
mysql -uroot -p$db_root_password <<QUERY_INPUT  
CREATE DATABASE $wordpress_db_name;  
GRANT ALL PRIVILEGES ON $wordpress_db_name.* TO 'root'@'localhost' IDENTIFIED BY '$db_root_password';  
FLUSH PRIVILEGES;  
EXIT;
QUERY_INPUT

sleep 1

## Add Database Credentias in wordpress
cd /var/www/html/
sudo mv wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/$wordpress_db_name/g" wp-config.php
perl -pi -e "s/username_here/root/g" wp-config.php
perl -pi -e "s/password_here/$db_root_password/g" wp-config.php

sleep 1

## Enabling Mod Rewrite
a2enmod rewrite
php5enmod mcrypt

sleep 1

## Install PhpMyAdmin  
apt-get install phpmyadmin -y

sleep 1

## Configure PhpMyAdmin
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf

## Restart Apache and Mysql
systemctl restart apache2
systemctl restart mysql

## Cleaning Download
cd $pwd
rm -rf latest.tar.gz wordpress

sleep 3

echo "Installation is complete."
