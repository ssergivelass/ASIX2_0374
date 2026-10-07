# Setmana 4 · Funcions i fitxers

Crea cada script dins d'aquesta carpeta amb el nom exacte que s'indica i comprova'ls amb `bash comprovar.sh`.
A la carpeta `dades/` tens fitxers de prova.

## 1_funcio.sh
Defineix una funció `saluda` que rep un nom i mostra `Hola, <nom>!`.
Després crida la funció dues vegades, amb `Anna` i amb `Pau`:
```
Hola, Anna!
Hola, Pau!
```
Pista: dins de la funció, el nom que rep és `$1`.

## 2_linies.sh
Rep un fitxer i compta quantes línies té, llegint-lo línia a línia amb `while read`.
```
$ bash 2_linies.sh dades/noms.txt
El fitxer dades/noms.txt té 6 línies
```
Si el fitxer no existeix, mostra `El fitxer no existeix` i acaba amb `exit 1`.
Pista:
```
while read LINIA; do
    ...
done < "$1"
```

## 3_llista.sh
Rep un fitxer amb un nom per línia i mostra cada nom precedit d'un guió. Les línies buides s'han d'ignorar.
Al final mostra el total de noms.
```
$ bash 3_llista.sh dades/noms_buits.txt
- anna
- pau
- marta
- jordi
Total: 4
```
Pista: `[ -z "$LINIA" ]` és cert quan la línia és buida.

## 4_cerca.sh
Rep una paraula i un fitxer, i diu en quantes línies apareix la paraula fent servir `grep -c`.
```
$ bash 4_cerca.sh Error dades/text.txt
La paraula Error apareix a 2 línies
```
Si no hi apareix, mostra el missatge següent i acaba amb `exit 1`:
```
$ bash 4_cerca.sh xarxa dades/text.txt
La paraula xarxa no apareix
```

## 5_registre.sh
Rep un missatge i l'afegeix al final del fitxer `registre.log` (a la carpeta actual) amb la data i l'hora davant.
Després mostra `Missatge registrat`.
```
$ bash 5_registre.sh "Còpia feta"
Missatge registrat
$ cat registre.log
2026-11-03 10:15 - Còpia feta
```
Cada execució afegeix una línia nova sense esborrar les anteriors.
Pista: `date "+%Y-%m-%d %H:%M"` i l'operador `>>`.
