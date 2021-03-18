#!/bin/bash

############################
##     INSTRUCCIONES      ##
############################
## Gestiona tareas del servidor squid

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

while :
    do
        clear

        echo ""
        echo -e "             $AM squid $RO"
        echo ""
        echo -e "   $RO 1)  $VE Deshabilitar del inicio"
        echo -e "   $RO 2)  $VE Habilitar en el inicio"
        echo -e "   $RO 3)  $VE Apagar"
        echo -e "   $RO 4)  $VE Encender"
        echo -e "   $RO 5)  $VE Reiniciar"
        echo -e "   $RO 6)  $VE Reinicio Seguro"
        echo -e "   $RO 0)  $VE Volver atrás$CL"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  ## Deshabilitar del inicio
            clear
            sudo systemctl disable squid
            read -p "Pulsa una tecla para continuar" input
            continue;;

        2)  ## Habilitar al inicio
            clear
            sudo systemctl enable squid
            read -p "Pulsa una tecla para continuar" input
            continue;;

        3)  ## Apagar
            clear
            sudo systemctl stop squid
            read -p "Pulsa una tecla para continuar" input
            continue;;

        4)  ## Encender
            clear
            sudo systemctl start squid
            read -p "Pulsa una tecla para continuar" input
            continue;;

        5)  ## Reiniciar
            clear
            sudo systemctl restart squid
            read -p "Pulsa una tecla para continuar" input
            continue;;

        6)  ## Reinicio Seguro
            clear
            sudo systemctl reload squid
            read -p "Pulsa una tecla para continuar" input
            continue;;


        0)  ## Volver Atrás
            clear
            break;;

        *)  ## Cualquier otra opción que no sea las anteriores
            clear
            echo ""
            echo -e "$RO La opción elegida no es válida$AM introduce otra"
            read -p "Pulsa una tecla para continuar" input;;
    esac
done
