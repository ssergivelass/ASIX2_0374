#!/bin/bash
# Script: usuari_a_grup.sh

NOM_USUARI="alumne1"
NOM_GRUP="desenvolupadors"

# -a (append) afegeix, -G especifica el grup secundari
sudo usermod -aG $NOM_GRUP $NOM_USUARI

echo "Usuari $NOM_USUARI afegit al grup $NOM_GRUP."
