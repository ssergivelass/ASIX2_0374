#!/bin/bash
# Script: eliminar_grup.sh

NOM_GRUP="desenvolupadors"

sudo groupdel $NOM_GRUP

echo "El grup $NOM_GRUP ha estat eliminat."
