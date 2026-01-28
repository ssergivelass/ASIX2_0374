#!/bin/bash
# Script: check_grup.sh

NOM_GRUP="sergio"

# grep busca el text dins del fitxer /etc/group
#if getent group "$NOM_GRUP"; then
if grep "$NOM_GRUP:" /etc/group; then
    echo "El grup $NOM_GRUP EXISTEIX."
else
    echo "El grup $NOM_GRUP NO existeix."
fi
