#!/bin/bash
# Comprovador dels exercicis de la setmana 4
# Ús: bash comprovar.sh        -> comprova tots els exercicis
#     bash comprovar.sh 2      -> comprova només l'exercici 2

cd "$(dirname "$0")" || exit 1
source ../lib_comprova.sh

prova_1() {
    exercici 1_funcio.sh || return
    igual "Mostra les dues salutacions" "$(printf 'Hola, Anna!\nHola, Pau!')" "$(executa 1_funcio.sh)"
    usa "Defineix la funció saluda" '(saluda[[:space:]]*\(\)|function[[:space:]]+saluda)'
    usa "Crida la funció amb Anna" '^[[:space:]]*saluda[[:space:]]+"?Anna'
}

prova_2() {
    exercici 2_linies.sh || return
    igual "Compta les línies de noms.txt" "El fitxer dades/noms.txt té 6 línies" "$(executa 2_linies.sh dades/noms.txt)"
    igual "Compta les línies de text.txt" "El fitxer dades/text.txt té 7 línies" "$(executa 2_linies.sh dades/text.txt)"
    local sortida
    sortida=$(executa 2_linies.sh dades/no_hi_es.txt)
    codi "Si no existeix acaba amb exit 1" 1 $?
    igual "Avisa si el fitxer no existeix" "El fitxer no existeix" "$sortida"
    usa "Llegeix el fitxer amb while read" 'while[[:space:]]+(IFS=[^ ]*[[:space:]]+)?read'
}

prova_3() {
    exercici 3_llista.sh || return
    local esperat
    esperat=$(printf -- '- anna\n- pau\n- marta\n- jordi\nTotal: 4')
    igual "Llista els noms i ignora les línies buides" "$esperat" "$(executa 3_llista.sh dades/noms_buits.txt)"
    igual "Mostra el total correcte amb noms.txt" "Total: 6" "$(executa 3_llista.sh dades/noms.txt | tail -n 1)"
}

prova_4() {
    exercici 4_cerca.sh || return
    igual "Troba Error 2 vegades" "La paraula Error apareix a 2 línies" "$(executa 4_cerca.sh Error dades/text.txt)"
    igual "Troba servidor 3 vegades" "La paraula servidor apareix a 3 línies" "$(executa 4_cerca.sh servidor dades/text.txt)"
    local sortida
    sortida=$(executa 4_cerca.sh xarxa dades/text.txt)
    codi "Si no la troba acaba amb exit 1" 1 $?
    igual "Avisa si no la troba" "La paraula xarxa no apareix" "$sortida"
    usa "Fa servir grep -c" 'grep[[:space:]]+(-[a-zA-Z]*c|.*-c)'
}

prova_5() {
    exercici 5_registre.sh || return
    local prova script
    script="$(pwd)/5_registre.sh"
    prova=$(mktemp -d)
    local sortida
    sortida=$(cd "$prova" && executa "$script" "primera prova")
    igual "Mostra Missatge registrat" "Missatge registrat" "$sortida"
    (cd "$prova" && executa "$script" "segona prova" > /dev/null)
    if [ -f "$prova/registre.log" ]; then
        ok "Crea el fitxer registre.log"
        igual "Afegeix una línia per execució" "2" "$(wc -l < "$prova/registre.log")"
        local ultima
        ultima=$(tail -n 1 "$prova/registre.log")
        if echo "$ultima" | grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} - segona prova$'; then
            ok "La línia té el format AAAA-MM-DD HH:MM - missatge"
        else
            ko "La línia té el format AAAA-MM-DD HH:MM - missatge" "$(date "+%Y-%m-%d %H:%M") - segona prova" "$ultima"
        fi
    else
        ko "Crea el fitxer registre.log a la carpeta actual"
    fi
    rm -rf "$prova"
}

for n in 1 2 3 4 5; do
    if [ -z "$1" ] || [ "$1" = "$n" ]; then
        prova_$n
    fi
done
resum
