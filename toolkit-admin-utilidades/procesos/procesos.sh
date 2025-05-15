#!/bin/bash

# Script de gestion basica de procesos

while true; do
    clear
    echo "============================================="
    echo " GESTION BASICA DE PROCESOS"
    echo "============================================="
    echo "1. Ver procesos en ejecucion"
    echo "2. Ver detalles de un proceso por PID"
    echo "3. Enviar señal a un proceso para terninarlo"
    echo "0. Volver al menu principal"
    echo "============================================="
    read -p "Selecciona una opcion: " opcion

    case $opcion in
    1)
        echo "Procesos en ejecucion:"
        sudo ps -eo pid,user,args,%cpu,%mem --sort=-%cpu
        echo ""
        read -p "Presiona Enter para continuar"
        ;;
    2)
        read -p "Ingresa el PID: " pid
        if ps -p "$pid" >/dev/null; then
            ps -p "$pid" -o pid,user,group,comm,args,%cpu,%mem,etime,stat,start,time
        else
            echo "PID no encontrado."
        fi
        read -p "Presiona Enter para continuar..."
        ;;
    3)
        read -p "Ingresa el PID al que deseas enviar la senal: " pid
        if ps -p "$pid" >/dev/null; then
            read -p "Estas seguro de enviar SIGTERM, esta accion terminara el proceso: $pid? (s/n): " confirm
            if [[ $confirm == "s" || $confirm == "S" ]]; then
                kill -15 "$pid" && echo "Senal enviada correctamente." || echo "Error al enviar la senal."
            else
                echo "Operacion cancelada."
            fi
        else
            echo "PID no encontrado."
        fi
        read -p "Presiona Enter para continuar..."
        ;;
    0)
        break
        ;;
    *)
        echo "Opcion no valida. Presiona Enter para continuar."
        read
        ;;
    esac
done
