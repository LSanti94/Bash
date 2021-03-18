#!/bin/bash

####Utilizar yum para encontrar las respuestas a las preguntas####

ehco "1. ¿Cuántos avisos de seguridad, avisos de corrección de errores y avisos de mejoras están
disponibles para su máquina?"

echo "2. ¿Cuántos paquetes relacionados con la seguridad están disponibles para su máquina?"

echo "3. ¿Cuántos Avisos de Seguridad de Red Hat (RHSA) de gravedad crítica, unicos están disponibles
#para su máquina?"

echo "4. Teniendo en cuenta el siguiente ejemplo de salida de updateinfo, ¿qué RPM actualizado deve instalarse en esta máquina para garantizar que se hayan resuelto todos los avisos de seguridad de
Red Hat?"

echo "5. Dado el siguiente ejemplo de salida de updateinfo ¿qué RPM actualizado debe instalarsei garantizando que se hayan resuelto todos los avisos de seguridad de Red Hat?"

echo "6. ¿Cómo vería un resumen de Red Hat Security Advisory RHSA-2013:0689?"

echo "7. ¿Cómo generaría una lista de todos los paquetes que deberían actualizarse para resolver RHSA201X:XXXX?"

echo "8. ¿Cuántos paquetes deverían actualizarse para resolver el número de vulnerabilidad y exposición común CVE-201X-XXXX?"

sleep 5m

#Ahi vemos cual es el aviso de seguridad##
echo"1"
echo ""
yum updateinfo
sleep 2
echo""

#Vamos a ver que comando se utilizara para la seguridad
yum --help | grep secu
echo ""

#Con esto me muestra que paquetes necesitan ser actualizados de seguridad
echo "2"
yum --security list updates
sleep 5
echo ""

#Aca podemos ver todo pero solo observariamos o prestaremos atención al critical
echo "3"
yum updateinfo
echo ""
sleep 3

#Realiza un filtro para que solo nos muestre cuantos critical hay.
echo ""
yum updateinfo list | grep 'Critical' | cut -f1 -d ' ' | sort -u | wc -l
echo ""
sleep 3

#Vemos cuales son los paquetes de seguridad que nos faltan.
echo "4"
yum updateinfo list
echo ""
sleep 10

#En mi caso voy a ver del kernel va a tener que ser actualizado para mejorar la parte de la seguridad, nos muestra dos de los cuales serán resueltos al instalarse, lo que me muestra es:                                                                   FEDORA-2020-5aba194675 arreglo de error kernel-5.8.11-200.fc32.x86_64               FEDORA-2020-e288acda9a Crítico/Seg. kernel-5.8.15-201.fc32.x86_64
echo "5"
yum updateinfo list kernel
echo ""
sleep 3

#ver un resumen
echo "6"
yum updateinfo FEDORA-2020-5aba194675
sleep 5
echo ""

#generar la lista
echo "7"
yum updateinfo --advisory=FEDORA-2020-5aba194675
sleep 5
echo ""

#Cuantos paquetes deben actualizarse CVE
echo "8"
yum updateinfo --cve=CVE-2020-20054
sleep 5
echo ""
