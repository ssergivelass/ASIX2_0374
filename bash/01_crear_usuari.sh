#!/bin/bash
# Script: crear_usuari.sh

NOM_USUARI="alumne1"

# -m crea el directori home (/home/alumne1)
sudo useradd -m $NOM_USUARI

echo "L'usuari $NOM_USUARI ha estat creat."
