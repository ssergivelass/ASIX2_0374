#!/bin/bash
# Script: assignar_password.sh

NOM_USUARI="alumne1"
CONTRASENYA="qazQAZ123"
useradd $NOM_USUARI
# chpasswd llegeix el format usuari:contrasenya

echo "$NOM_USUARI:$CONTRASENYA" | sudo chpasswd
#O podem fer-ho manualment,ens demanarà el password.
passwd $NOM_USUARI
echo "Contrasenya actualitzada per a $NOM_USUARI."
