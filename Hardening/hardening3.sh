#!/bin/bash
#En este ejercicio de laboratorio, trabajará con varias claves GPG para determinar cuál se usa para firmar un paquete

echo "1. Importe dos archivos en el conjunto de claves RPM-GPG-KEY-Fedora-33"

echo "2. Verifique que el paquete RPM yelp-2.xx.x-xx.el7_3.x86_64.rpm en el directorio.some_repo_url/update esté firmado por GPG con una confiable llave."

echo "3. Enumeresus claves GPG de confianza en el conjunto de claves RPM GPG."

echo "4. Retire las Keys que NO firmaron el RPM de yelp."

sleep 3min

echo "1"
#Visualizar que llave tengo actualmente.
rpm -qa gpg-pubkey
sleep 1
echo ""

#Eliminar la llave.
sudo rpm -e gpg-pubkey-9570ff31-5e3006fb
sleep 3
#Descargar una llave
sudo rpm --import http://mirror.fedora.org/fedora/RPM-GPG-KEY-Fedora-33
sleep 3
#Observos que tengo la misma versión
rpm -qa gpg-pubkey
sleep 3
#Utilizo otro rpm y me mostra que es lo que realiza los scripts.
sudo rpm -qp --scripts http://mirror.fedora.org/fedora/epel-release-Fedora33
sleep 3
#No está firmado por epel y no la tengo.
sudo rpm -Kv http://mirror.fedora.org/fedora/epel-realiza-Fedora33
sleep 3
#Como es del mismo fedora veremos que si se encuentra firmado, que es confiable.
sudo rpm -Kv http://mirror.fedora.org/fedora/pacemaker-remote-1.1.19-8.el7_6.4.x86_64.rpm
sleep 3
#Estoy agregando este repositorio o paquete.
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sleep 3
# Lo instalamos porque pertenece al repositorio epel y vamos a agregarle una llave.
yum install htop
sleep 3
#Observamos que si ya se tiene el certificado.
rpm -Kv https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sleep 5


echo "2"
sudo rpm -qa gpg-pubkey
echo "Vemos que ahora tenemos dos llaves."
sleep 4

sudo rpm -qi gpg-pubkey-3123hbd6c7d-13hdc
echo "Verificar el key de donde viene."
sleep 5

echo "3"
#Enumerara las keys
sudo rpm -qa gpg-pubkey
sleep 5

echo "4"
#Verifico que key si esta correcto si no lo borro como es a continuacion.
sudo rpm -qi gpg-pubkey-7a8d6g22-qu88dqdgy

echo "Eliminar un rpm."
sudo rpm -e gpg-pubkey-7a8d6g22-qu88dqdgy
