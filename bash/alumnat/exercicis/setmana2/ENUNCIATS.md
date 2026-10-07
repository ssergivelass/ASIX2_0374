# Setmana 2 · Variables, arguments i decisions

Crea cada script dins d'aquesta carpeta amb el nom exacte que s'indica i comprova'ls amb `bash comprovar.sh`.

Recorda: `$1` és el primer argument, `$2` el segon i `$#` el nombre d'arguments.
Per acabar un script amb error fes servir `exit 1`.

## 1_salutacio.sh
Rep un nom com a argument i el saluda:
```
$ bash 1_salutacio.sh Anna
Hola, Anna!
```
Si no rep cap argument, mostra el missatge d'ús i acaba amb `exit 1`:
```
$ bash 1_salutacio.sh
Ús: 1_salutacio.sh <nom>
```

## 2_edat.sh
Pregunta l'edat amb `read` i diu si és major o menor d'edat (18 anys o més és major d'edat):
```
Quina edat tens? 20
Ets major d'edat
```
```
Quina edat tens? 15
Ets menor d'edat
```
Pista: `read -p "Quina edat tens? " EDAT`

## 3_parell.sh
Rep un número com a argument i diu si és parell o senar.
```
$ bash 3_parell.sh 4
4 és parell
$ bash 3_parell.sh 7
7 és senar
```
Pista: el residu de dividir per 2 és `$(( N % 2 ))`.

## 4_tipus.sh
Rep un camí com a argument i diu si és un fitxer, un directori o si no existeix.
Si no existeix, a més, acaba amb `exit 1`.
```
$ bash 4_tipus.sh /etc/passwd
/etc/passwd és un fitxer
$ bash 4_tipus.sh /etc
/etc és un directori
$ bash 4_tipus.sh /res
/res no existeix
```
Pista: `[ -f "$1" ]` comprova si és un fitxer i `[ -d "$1" ]` si és un directori.

## 5_suma.sh
Rep dos números i en mostra la suma.
```
$ bash 5_suma.sh 3 4
La suma és 7
```
Si no rep exactament dos arguments, mostra aquest missatge i acaba amb `exit 1`:
```
Cal indicar dos números
```
