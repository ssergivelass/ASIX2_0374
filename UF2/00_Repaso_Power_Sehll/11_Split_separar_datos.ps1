
#Divide la cadena "Hola que tal" en varias cadenas utilizando el espacio como separador
-split "Hola que tal"

#Divide la cadena "texto,separado,por,comas" en varias cadenas utilizando la coma como separador
"texto,separado,por,comas" -split ","

#Divide la cadena "texto,separado,por,comas" en varias cadenas utilizando la coma como separador
$valor2 = "texto,separado,por,comas,en,la,clase,de,m6,uf2,p1f"
# este comando divide la cadena almacenada en $valor2 en varias cadenas utilizando la coma como separador
$valor2 -split "," 

#Inicializa la variable $item en 0
$item = 0
#Utiliza un ciclo 'foreach' para iterar sobre cada una de las cadenas resultantes de dividir $valor2 con la función 'split' utilizando "," como separador.
foreach ($i in $valor2 -split ",")
{
  #En cada iteración, se incrementa el valor de $item en 1 y se imprime su valor y el valor de la cadena actual ($i)
  $item = $item +1 

  Write-Host $item " : " $i   
}


#Pide al usuario que introduzca dos palabras separadas por una coma y almacena el resultado en la variable $valor
$valor = Read-Host "Introduce dos palabras separadas por ," 
Write-Host $valor " Esta es la cadena"
#Divide la cadena almacenada en $valor en varias cadenas utilizando la coma como separador
$valor -split "," 

$_


#Ref
#https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_split?view=powershell-7.3
#https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-7.3
#https://www.computerperformance.co.uk/powershell/dollar-variable/#PowerShells_$__Variable