#!/bin/bash
# Comprovador dels exercicis de la setmana 3
# Ús: bash comprovar.sh        -> comprova tots els exercicis
#     bash comprovar.sh 2      -> comprova només l'exercici 2

cd "$(dirname "$0")" || exit 1
source ../lib_comprova.sh

prova_1() {
    exercici 1_dia.sh || return
    igual "L'1 és Dilluns" "Dilluns" "$(executa 1_dia.sh 1)"
    igual "El 3 és Dimecres" "Dimecres" "$(executa 1_dia.sh 3)"
    igual "El 7 és Diumenge" "Diumenge" "$(executa 1_dia.sh 7)"
    local sortida
    sortida=$(executa 1_dia.sh 9)
    codi "El 9 acaba amb exit 1" 1 $?
    igual "El 9 no és vàlid" "Dia no vàlid" "$sortida"
    usa "Fa servir case" '\bcase\b'
}

prova_2() {
    exercici 2_taula.sh || return
    local sortida
    sortida=$(executa 2_taula.sh 3)
    igual "Primera línia de la taula del 3" "3 x 1 = 3" "$(echo "$sortida" | sed -n 1p)"
    igual "Última línia de la taula del 3" "3 x 10 = 30" "$(echo "$sortida" | sed -n 10p)"
    igual "Té exactament 10 línies" "10" "$(echo "$sortida" | wc -l)"
    igual "Funciona amb el 7" "7 x 6 = 42" "$(executa 2_taula.sh 7 | sed -n 6p)"
    usa "Fa servir for" '\bfor\b'
}

prova_3() {
    exercici 3_compte.sh || return
    igual "Compte enrere des de 3" "$(printf '3\n2\n1\nEnlairament!')" "$(executa 3_compte.sh 3)"
    igual "Compte enrere des de 1" "$(printf '1\nEnlairament!')" "$(executa 3_compte.sh 1)"
    usa "Fa servir while" '\bwhile\b'
}

prova_4() {
    exercici 4_contingut.sh || return
    local prova
    prova=$(mktemp -d)
    mkdir "$prova/carpeta"
    touch "$prova/arxiu.txt" "$prova/notes"
    local esperat
    esperat=$(printf '[F] arxiu.txt\n[D] carpeta\n[F] notes')
    igual "Llista el contingut amb [F] i [D]" "$esperat" "$(executa 4_contingut.sh "$prova")"
    local sortida
    sortida=$(executa 4_contingut.sh "$prova/notes")
    codi "Si no és un directori acaba amb exit 1" 1 $?
    igual "Avisa si no és un directori" "No és un directori" "$sortida"
    rm -rf "$prova"
}

prova_5() {
    exercici 5_menu.sh || return
    local sortida
    sortida=$(executa_amb_entrada "2\n3\n" 5_menu.sh)
    codi "Acaba en triar l'opció 3" 0 $?
    conte "L'opció 2 mostra l'usuari" "$(whoami)" "$sortida"
    conte "L'opció 3 diu Adéu!" "Adéu!" "$sortida"
    sortida=$(executa_amb_entrada "9\n3\n" 5_menu.sh)
    conte "Una opció incorrecta mostra Opció no vàlida" "Opció no vàlida" "$sortida"
    sortida=$(executa_amb_entrada "1\n3\n" 5_menu.sh)
    conte "L'opció 1 mostra la data" "$(date +%Y)" "$sortida"
    sortida=$(executa_amb_entrada "9\n9\n3\n" 5_menu.sh)
    igual "El menú es repeteix fins a sortir" "2" "$(echo "$sortida" | grep -c 'Opció no vàlida')"
}

for n in 1 2 3 4 5; do
    if [ -z "$1" ] || [ "$1" = "$n" ]; then
        prova_$n
    fi
done
resum
