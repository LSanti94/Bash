#!/bin/bash
#################################################################
#################                                               #
### VARIABLES ###                                               #
#################                                               #
                                                                #
backup_archivos="/home /var/log"                                #
destino="/mnt/backup"                                           #
dia=$(date +%d-%m-%y)                                           #
hostname=$(hostname -s)                                         #
archivo="$hostname-$dia.tar.gz"                                 #
                                                                #
#################################################################

sleep 1

echo "Realizando backup: $backup_archivos para $destino/$archivo"

sleep 1

tar -zcvf $destino/$archivo $backup_archivos

sleep 1

echo "Backup realizado con exito!"

ls -lh $destino
