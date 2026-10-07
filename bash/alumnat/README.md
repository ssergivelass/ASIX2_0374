# Scripting Bash · ASIX2

Carpeta de treball de la unitat. Tot es fa dins la màquina virtual que crea Vagrant.

## Posar en marxa la màquina

1. Instal·la VirtualBox i Vagrant (setmana 1, a classe).
2. Obre un terminal en aquesta carpeta i executa `vagrant up`.
3. Entra a la màquina amb `vagrant ssh`. Començaràs a `/vagrant`, que és aquesta mateixa carpeta.
4. En acabar, surt amb `exit` i apaga la màquina amb `vagrant halt`.

Pots editar els scripts des del teu ordinador (amb VS Code, Notepad++…) i executar-los dins la màquina:
els canvis es veuen a les dues bandes.

## Exercicis

Cada setmana té una carpeta a `exercicis/` amb:

- `ENUNCIATS.md`: què has de fer.
- `comprovar.sh`: et diu si cada exercici funciona.

```
cd /vagrant/exercicis/setmana2
bash comprovar.sh       # tots
bash comprovar.sh 3     # només l'exercici 3
```

Si un script dona errors estranys i l'has escrit a Windows, converteix-lo amb `dos2unix nom.sh`.
