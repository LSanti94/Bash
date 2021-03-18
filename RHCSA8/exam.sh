#!/bin/bash
echo ""
echo -e "\033[1mListo para comenzar el Examen de Practica\033[0m"
echo -e "\033[1mEste script le rompera su sistema literalmente\033[0m"
echo -e "\033[1mSon unos pocos cambios para que su sistema quede listo\n\033[0m"

for i in {5..1};do echo -n "$i." && sleep 1; done
echo ""
echo ""

echo -e "\033[1mComenzando en breve........\n\033[0m"
for i in {5..1};do echo -n "$i." && sleep 1; done
echo ""
echo ""
echo -e "\e[1;31mCambiando a multi-user.target\n\e[0m"
systemctl set-default multi-user.target
sleep 5

echo ""
echo -e "\e[1;31mCambiando root password\n\e[0m"
sleep 5
echo 'root:$1$66Ct3xKK$XnX7iv0R1BehDw5O.dahX.' | chpasswd -e

echo -e "\e[1;31mCambiando SELInux estatus\n\e[0m"
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
sleep 5

echo -e "\e[1;31mRompiendo hostname file\n\e[0m"
hostnamectl set-hostname blabla.sindominio.org
sleep 5

## Adding and enabling the base repo
yum-config-manager --add-repo ftp://servidoripa.example.com/pub/repos/base.repo
yum-config-manager --enable base

### Apache ###
yum install -y httpd httpd-manual
systemctl start httpd
systemctl enable httpd
mkdir /web1
echo "Hola esta es una web de pruebas" >> /web1/index.html
rm -rf /etc/httpd/conf.d/welcome.conf
systemctl restart httpd

echo "<VirtualHost *:80>" >> /etc/httpd/conf.d/vhost.conf
echo "ServerAdmin webmaster@station01.example.com" >> /etc/httpd/conf.d/vhost.conf
echo "DocumentRoot "/web1"" >> /etc/httpd/conf.d/vhost.conf
echo "ServerName station01.example.com" >> /etc/httpd/conf.d/vhost.conf
echo "ServerAlias station01.example.com" >> /etc/httpd/conf.d/vhost.conf
echo "ErrorLog "/var/log/httpd/station01.example.com-error_log"" >> /etc/httpd/conf.d/vhost.conf
echo "CustomLog "/var/log/httpd/station01.example.com-access_log" combined" >> /etc/httpd/conf.d/vhost.conf
echo "</VirtualHost>" >> /etc/httpd/conf.d/vhost.conf
echo "<Directory "/web1">" >> /etc/httpd/conf.d/vhost.conf
echo "AllowOverride None" >> /etc/httpd/conf.d/vhost.conf
echo "Require all granted" >> /etc/httpd/conf.d/vhost.conf
echo "</Directory>" >> /etc/httpd/conf.d/vhost.conf

rm -rf /etc/yum.repos.d/*

echo -e "\e[1;31mRompiendo Configuracion de red\n\e[0m"
for i in `nmcli -f CONNECTIONS device show | grep -i CONNECTIONS.AVAILABLE-CONNECTIONS | awk '{ print $2 }'`; do nmcli connection delete $i; done
sleep 5

### Grub ###
#grub2-set-default 1
sed -i -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=2/' /etc/default/grub
#grub2-mkconfig > /boot/grub2/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg 2> /dev/null

### fstab ###
sed -i -e 's/root/rOoT/g' /etc/fstab
sed -i -e 's/xfs/rty/g' /etc/fstab

echo ""
echo -e "\e[1;31mListo para comenzar en:\n\e[0m"

for i in {5..1};do echo -n "$i." && sleep 1; done
systemctl reboot

