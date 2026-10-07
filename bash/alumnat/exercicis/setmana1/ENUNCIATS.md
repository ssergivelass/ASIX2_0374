# Setmana 1 · Primers scripts

Crea cada script dins d'aquesta carpeta (`/vagrant/exercicis/setmana1`) amb el nom exacte que s'indica.
Tots han de començar amb la línia `#!/bin/bash`.

Quan acabis, comprova'ls amb:

```
bash comprovar.sh       # tots els exercicis
bash comprovar.sh 3     # només l'exercici 3
```

## 1_hola.sh
Mostra exactament aquest missatge:
```
Hola, món!
```

## 2_info.sh
Mostra l'usuari que executa l'script i el nom de l'equip, fent servir les ordres `whoami` i `hostname`:
```
Usuari: vagrant
Equip: bash-asix2
```

## 3_presentacio.sh
Defineix dues variables: `NOM` amb el teu nom i `CICLE` amb el valor `ASIX2`.
Després mostra una frase fent servir les dues variables:
```
Em dic Laia i estudio ASIX2
```

## 4_data.sh
Mostra la data d'avui en format dia/mes/any. Pista: `date +%d/%m/%Y`
```
Avui és 13/10/2026
```
