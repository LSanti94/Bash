#!/bin/bash
############
##Actualizaciones relacionadas con la seguridad a las máquinas que administra

echo "1. ¿Hay algún requisito previo que deba verificarse antes de que se ejecute ese cambio? (paquetes de software específicos, archivos de configuración, almacenamiento, cuentas de usuario, etc.)"

echo "2. ¿Cuáles son los pasos (comandos) que ejecutará para completar esta tarea?"

echo "3. ¿Hay alguna tarea complementaria que deba realizarse debido a este cambio? (reiniciar, reiniciar servicio, etc.)"

echo "4. ¿Cómo verificará que los cambios aplicados al sistema tuvieron éxito?"

echo "5. ¿Qué necesitaría hacer para cancelar los cambios en caso de que causen problemas?"

sleep 3min

echo ""
echo ""
echo ""
echo "1"
sudo yum provides yum-plugin-secrity

echo "2"
yum updateinfo
sleep 5

echo "Solo seguridad se actualizara"
sudo yum --security update -y
sleep 5

echo "3"
echo "Si tenemos actualización de kernel si se reicnicia el servidor sytemd, apache algun servico en el caso no sea así no es necesario reiniciar"
sleep 5

echo "4"
echo "verifico si tengo alguna tarea pendiente"
yum updateinfo
sleep 4

echo "5"
#yum downgrade
yum --bugfix update
echo "Verficar si a tenido exito, utilizar downgrade si salio algo mal, bugfix son paquetes de fedora."

