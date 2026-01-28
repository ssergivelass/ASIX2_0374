#!/bin/bash
# Script: crear_grup.sh

NOM_GRUP="desenvolupadors"

sudo groupadd $NOM_GRUP

echo "El grup $NOM_GRUP ha estat creat."
