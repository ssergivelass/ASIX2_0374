#!/bin/bash
# Script: eliminar_usuari.sh

NOM_USUARI="alumne1"

# -r elimina també el directori /home/usuari
sudo userdel -r $NOM_USUARI

echo "L'usuari $NOM_USUARI i el seu directori han estat eliminats."
