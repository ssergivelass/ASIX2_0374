#!/bin/bash
# Script: crear_usuari_params.sh

NOM_USUARI="alumne2"
SHELL_PER_DEFECTE="/bin/bash"
NOM_COMPLET="Alumne de Prova"

# -s defineix la shell
# -c afegeix un comentari (nom complet)
sudo useradd -m -s $SHELL_PER_DEFECTE -c "$NOM_COMPLET" $NOM_USUARI

echo "Usuari $NOM_USUARI creat amb paràmetres personalitzats."
