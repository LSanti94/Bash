#!/bin/bash
######################
### laboratorio 2 ####
######################

###aplicará todas las actualizaciones pendientes relacionadas con la seguridad a su máquina###

echo "Descripción general del laboratorio: En este ejercicio, aplicará todas las actualizaciones pendientes relacionadas con la seguridad a su máquina."

echo "1. Antes de aplicar cualquier actualización, capture una lista del software actualmente instalado. Coloque la lista en un archivo llamado /root/pre-update-software. YYYYMMDD, donde YYYYMMDD es la fecha de hoy con formato ISO."

echo "2. Ver un informe de actualizaciones pendientes, incluidas las actualizaciones de seguridad. Guarde una copia de este informe en /root/updateinfo-report.YYYYMMDD donde YYYYMMDD es la fecha de hoy con formato ISO"

echo "3. Aplique todas las actualizaciones de seguridad pendientes a su máquina."

echo "4 Verifique que no haya erratas de seguridad pendientes disponibles para la máquina"
echo ""
echo ""
echo ""
sleep 3min

echo "Puede comparar el informe posterior a la actualización con el que capturó anteriormente en /root/updateinfo-report. YYYYMMDD"

#Consulta a la base de datos con -q y -a muestra todos paquetes instalados
rpm -qa 

sleep 10

echo "1"
rpm -qa > /root/pre-update-software.$(date +%Y%m%d)
less pre-update-software.20201024 | cat -n
less pre-update-software.20201024 | wc -l

sleep 1
echo ""

#genera el informe.

echo "2"
yum updateinfo
yum updateinfo > /root/updateinfo-repot.$(date +%Y%m%d)
sleep 4
echo ""

echo "3"
yum update --security
sleep 4
echo ""

echo "4"
cat updateinfo-report20201024
sleep "2"
echo ""

#Comparamos los comandos anteriores a ver si en seguridad ya me sale 0 o que no hay nada pendiente, a veces hay que reiniciar.

yum updateinfo
