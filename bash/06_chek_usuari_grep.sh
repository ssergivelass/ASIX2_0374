#!/bin/bash
# Script: check_usuari_grep.sh

NOM_USUARI="alumne3"

if grep $NOM_USUARI /etc/passwd; then
    echo "L'usuari $NOM_USUARI existeix (trobat a /etc/passwd)."
else
    echo "L'usuari $NOM_USUARI NO existeix."
fi
