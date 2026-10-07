#!/bin/bash
# Comprovador dels exercicis de la setmana 2
# Ús: bash comprovar.sh        -> comprova tots els exercicis
#     bash comprovar.sh 2      -> comprova només l'exercici 2

cd "$(dirname "$0")" || exit 1
source ../lib_comprova.sh

prova_1() {
    exercici 1_salutacio.sh || return
    igual "Saluda el nom rebut" "Hola, Anna!" "$(executa 1_salutacio.sh Anna)"
    igual "Funciona amb un altre nom" "Hola, Pau!" "$(executa 1_salutacio.sh Pau)"
    local sortida
    sortida=$(executa 1_salutacio.sh)
    codi "Sense argument acaba amb exit 1" 1 $?
    conte "Sense argument mostra el missatge d'ús" "Ús:" "$sortida"
}

prova_2() {
    exercici 2_edat.sh || return
    conte "Amb 20 diu que és major d'edat" "Ets major d'edat" "$(executa_amb_entrada "20\n" 2_edat.sh)"
    conte "Amb 15 diu que és menor d'edat" "Ets menor d'edat" "$(executa_amb_entrada "15\n" 2_edat.sh)"
    conte "Amb 18 diu que és major d'edat" "Ets major d'edat" "$(executa_amb_entrada "18\n" 2_edat.sh)"
    usa "Fa servir read" 'read'
}

prova_3() {
    exercici 3_parell.sh || return
    igual "El 4 és parell" "4 és parell" "$(executa 3_parell.sh 4)"
    igual "El 7 és senar" "7 és senar" "$(executa 3_parell.sh 7)"
    igual "El 0 és parell" "0 és parell" "$(executa 3_parell.sh 0)"
}

prova_4() {
    exercici 4_tipus.sh || return
    igual "Detecta un fitxer" "/etc/passwd és un fitxer" "$(executa 4_tipus.sh /etc/passwd)"
    igual "Detecta un directori" "/etc és un directori" "$(executa 4_tipus.sh /etc)"
    local sortida
    sortida=$(executa 4_tipus.sh /no/existeix)
    codi "Si no existeix acaba amb exit 1" 1 $?
    igual "Detecta que no existeix" "/no/existeix no existeix" "$sortida"
}

prova_5() {
    exercici 5_suma.sh || return
    igual "Suma 3 i 4" "La suma és 7" "$(executa 5_suma.sh 3 4)"
    igual "Suma 10 i -2" "La suma és 8" "$(executa 5_suma.sh 10 -2)"
    local sortida
    sortida=$(executa 5_suma.sh 3)
    codi "Amb un sol número acaba amb exit 1" 1 $?
    igual "Amb un sol número mostra l'avís" "Cal indicar dos números" "$sortida"
    executa 5_suma.sh 1 2 3 > /dev/null
    codi "Amb tres números acaba amb exit 1" 1 $?
}

for n in 1 2 3 4 5; do
    if [ -z "$1" ] || [ "$1" = "$n" ]; then
        prova_$n
    fi
done
resum
