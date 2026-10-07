#!/bin/bash
# Funcions comunes dels comprovadors d'exercicis. No cal modificar aquest fitxer.

VERD='\e[32m'; VERMELL='\e[31m'; GROC='\e[33m'; RESET='\e[0m'
TOTAL_OK=0
TOTAL_KO=0
EX_KO=0

# Executa un script amb bash, amb un límit de 3 segons, sense entrada de teclat
executa() {
    timeout 3 bash "$@" 2>&1 < /dev/null
}

# Executa un script passant-li text com si s'escrivís pel teclat
# Ús: executa_amb_entrada "text" script arguments...
executa_amb_entrada() {
    local entrada="$1"
    shift
    printf "%b" "$entrada" | timeout 3 bash "$@" 2>&1
}

# Comença la comprovació d'un exercici. Retorna 1 si el fitxer no es pot provar.
exercici() {
    FITXER="$1"
    EX_KO=0
    echo
    echo "=== $FITXER ==="
    if [ ! -f "$FITXER" ]; then
        echo -e "  ${GROC}[--]${RESET} No existeix el fitxer $FITXER"
        TOTAL_KO=$((TOTAL_KO + 1))
        return 1
    fi
    if grep -q $'\r' "$FITXER"; then
        echo -e "  ${VERMELL}[KO]${RESET} El fitxer té format Windows. Executa: dos2unix $FITXER"
        TOTAL_KO=$((TOTAL_KO + 1))
        return 1
    fi
    if [ "$(head -n 1 "$FITXER")" = "#!/bin/bash" ]; then
        ok "La primera línia és #!/bin/bash"
    else
        ko "La primera línia ha de ser #!/bin/bash"
    fi
    return 0
}

ok() {
    echo -e "  ${VERD}[OK]${RESET} $1"
    TOTAL_OK=$((TOTAL_OK + 1))
}

ko() {
    echo -e "  ${VERMELL}[KO]${RESET} $1"
    if [ -n "$2" ]; then
        echo "       S'esperava:  $2"
    fi
    if [ -n "$3" ]; then
        # Només es mostren les primeres línies per si l'script ha fet un bucle infinit
        echo "       S'ha obtingut: $(printf "%s" "$3" | head -n 5 | cut -c 1-120)"
        if [ "$(printf "%s\n" "$3" | wc -l)" -gt 5 ]; then
            echo "       (...)"
        fi
    fi
    TOTAL_KO=$((TOTAL_KO + 1))
    EX_KO=$((EX_KO + 1))
}

# Compara la sortida obtinguda amb l'esperada (text exacte)
# Ús: igual "descripció" "esperat" "obtingut"
igual() {
    if [ "$2" = "$3" ]; then
        ok "$1"
    else
        ko "$1" "$2" "$3"
    fi
}

# Comprova que la sortida conté un text
# Ús: conte "descripció" "text" "sortida"
conte() {
    if printf "%s" "$3" | grep -qF -- "$2"; then
        ok "$1"
    else
        ko "$1" "que contingui: $2" "$3"
    fi
}

# Comprova que el codi de sortida és el que toca
# Ús: codi "descripció" esperat obtingut
codi() {
    if [ "$2" = "$3" ]; then
        ok "$1"
    elif [ "$3" = "124" ]; then
        ko "$1" "codi de sortida $2" "l'script no acaba (bucle infinit o espera dades de teclat)"
    else
        ko "$1" "codi de sortida $2" "codi de sortida $3"
    fi
}

# Comprova que el fitxer de l'exercici conté un text (per exemple, una ordre concreta)
# Ús: usa "descripció" "patró"
usa() {
    if grep -qE -- "$2" "$FITXER"; then
        ok "$1"
    else
        ko "$1"
    fi
}

resum() {
    echo
    echo "-----------------------------------------"
    if [ "$TOTAL_KO" -eq 0 ]; then
        echo -e "${VERD}Tot correcte: $TOTAL_OK proves superades.${RESET}"
    else
        echo -e "Proves superades: ${VERD}$TOTAL_OK${RESET}   Proves fallades: ${VERMELL}$TOTAL_KO${RESET}"
    fi
    echo "-----------------------------------------"
}
