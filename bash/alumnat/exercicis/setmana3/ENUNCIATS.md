# Setmana 3 · Menús i bucles

Crea cada script dins d'aquesta carpeta amb el nom exacte que s'indica i comprova'ls amb `bash comprovar.sh`.

## 1_dia.sh
Rep un número de l'1 al 7 i mostra el dia de la setmana fent servir `case`.
```
$ bash 1_dia.sh 1
Dilluns
$ bash 1_dia.sh 7
Diumenge
```
Els dies són: Dilluns, Dimarts, Dimecres, Dijous, Divendres, Dissabte, Diumenge.
Si el número no és de l'1 al 7, mostra `Dia no vàlid` i acaba amb `exit 1`.

## 2_taula.sh
Rep un número i mostra la seva taula de multiplicar de l'1 al 10 fent servir `for`.
```
$ bash 2_taula.sh 3
3 x 1 = 3
3 x 2 = 6
...
3 x 10 = 30
```
Pista: `for i in {1..10}` o `for i in $(seq 1 10)`.

## 3_compte.sh
Rep un número i fa un compte enrere fins a 1 fent servir `while`. Al final mostra `Enlairament!`.
```
$ bash 3_compte.sh 3
3
2
1
Enlairament!
```

## 4_contingut.sh
Rep un directori i, per a cada element que conté, mostra `[F]` si és un fitxer o `[D]` si és un directori, seguit del nom.
```
$ bash 4_contingut.sh /vagrant
[D] exercicis
[F] Vagrantfile
```
Si l'argument no és un directori, mostra `No és un directori` i acaba amb `exit 1`.
Pista: `for element in "$1"/*` i, per mostrar només el nom, `basename "$element"`.

## 5_menu.sh
Mostra aquest menú i llegeix l'opció amb `read`. El menú es repeteix fins que es tria `3`.
```
1) Mostrar la data
2) Mostrar l'usuari
3) Sortir
```
- Opció 1: mostra la data (`date`).
- Opció 2: mostra l'usuari (`whoami`).
- Opció 3: mostra `Adéu!` i acaba.
- Qualsevol altra opció: mostra `Opció no vàlida`.

Pista: un bucle `while true` amb un `case` a dins.
