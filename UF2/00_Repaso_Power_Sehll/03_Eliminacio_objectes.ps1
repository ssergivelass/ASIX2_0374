#Deixem els contenidors i eliminem els objectes

#Eliminime usuaris
Remove-ADUser -Identity rdominguez
Remove-ADUser -Identity clopez
Remove-ADUser -Identity jmartinez
#Eliminem Grups
Remove-ADGroup -Identity RecursosHumanos