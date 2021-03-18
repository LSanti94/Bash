#!/bin/bash
############

###yum updateinfo para consultar las actualizaciones disponibles###

echo "1. Verifique que el complemento de seguridad de yum esté instalado en su máquina."

echo "2. Genere un informe que contenga el número de actualizaciones disponibles para la máquina,completo con la categorización de seguridad (con severidad), correción de errores o mejoras."

echo "3. Genere un informe de todos los Avisos de seguridad de Red Hat (RHSA), los Avisos de errores de Red Hat (RHBA) y los Avisos de mejora de Red Hat (RHEA) pendientes con los paquetes de RPM a los que afectan."

echo "4. Ver los contenidos de Red Hat Security Advisory RHSA-201X: XXXX."

echo "5. Genere un informe de todas las actualizaciones, para esta máquina, que se requeriría para resolver CVE-201X-XXXX."
echo ""
echo ""
echo ""

echo "1"
echo "Observamos que ya esta instalado, a partir del red hat 8 ya se encuentra instalado igual en fedora 32 y centos 8."
sleep 10
yum install -y yum-plugin-security
sleep 3
echo ""

echo "2"
echo "Genera informe, pero no tengo nada listado."
sleep 5
yum updateinfo
sleep 3
echo ""

echo "3"
echo "Muestra el listado mas detallado, ahora puedo elegir uno de ellos"
sleep 5
yum updateinfo list
sleep 10
echo ""

echo "4"
echo "Observo que contenido tiene de Red Hat Security"
sleep 5
yum updateinfo FEDORA-2020-5d9f0ce2b3
sleep 6
echo ""

echo "5"
echo "Genera un informe para resolver el CVE para las actualizaciones"
sleep 5
yum updateinfo list --cve=CVE-2020-2422
sleep 6
echo ""
