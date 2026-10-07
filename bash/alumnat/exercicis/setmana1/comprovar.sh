#!/bin/bash
# Comprovador dels exercicis de la setmana 1
# Ús: bash comprovar.sh        -> comprova tots els exercicis
#     bash comprovar.sh 2      -> comprova només l'exercici 2

cd "$(dirname "$0")" || exit 1
source ../lib_comprova.sh

prova_1() {
    exercici 1_hola.sh || return
    igual "Mostra el missatge de salutació" "Hola, món!" "$(executa 1_hola.sh)"
}

prova_2() {
    exercici 2_info.sh || return
    local sortida
    sortida=$(executa 2_info.sh)
    igual "Primera línia: usuari" "Usuari: $(whoami)" "$(echo "$sortida" | sed -n 1p)"
    igual "Segona línia: equip" "Equip: $(hostname)" "$(echo "$sortida" | sed -n 2p)"
    usa "Fa servir l'ordre whoami" 'whoami'
    usa "Fa servir l'ordre hostname" 'hostname'
}

prova_3() {
    exercici 3_presentacio.sh || return
    local sortida
    sortida=$(executa 3_presentacio.sh)
    if echo "$sortida" | grep -qE '^Em dic .+ i estudio ASIX2$'; then
        ok "Mostra la presentació amb el format correcte"
    else
        ko "Mostra la presentació amb el format correcte" "Em dic <nom> i estudio ASIX2" "$sortida"
    fi
    usa "Defineix la variable NOM" '^[[:space:]]*NOM='
    usa "Defineix la variable CICLE" '^[[:space:]]*CICLE='
    usa "Fa servir les variables dins de l'echo" '\$\{?NOM\}?.*\$\{?CICLE\}?'
}

prova_4() {
    exercici 4_data.sh || return
    igual "Mostra la data d'avui" "Avui és $(date +%d/%m/%Y)" "$(executa 4_data.sh)"
    usa "Fa servir l'ordre date" 'date'
}

for n in 1 2 3 4; do
    if [ -z "$1" ] || [ "$1" = "$n" ]; then
        prova_$n
    fi
done
resum
