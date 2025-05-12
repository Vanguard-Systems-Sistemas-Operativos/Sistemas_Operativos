#!/bin/bash

# Toolkit de Administración Jr. - Menú Principal

while true; do
    clear
    echo "=============================="
    echo "  TOOLKIT DE ADMINISTRACIÓN JR"
    echo "=============================="
    echo "1. Monitoreo y gestión de procesos"
    echo "0. Salir"
    echo "------------------------------"
    read -p "Selecciona una opción: " opcion

    case $opcion in
    1) bash procesos/procesos.sh ;;
    0)
        echo "Saliendo..."
        break
        ;;
    *)
        echo "Opción no válida. Presiona Enter para continuar."
        read
        ;;
    esac
done
