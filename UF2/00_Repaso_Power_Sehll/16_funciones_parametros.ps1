#Ejemplos de funciones 

#parametres
param(
        $csv,$log
      )

function hora ($param1, $param2)
{
   <#
       .SYNOPSIS
       hora devuelve la hora actual del sistema
       .DESCRIPTION
       simplemente llama la funcion 'hora'
       .EXAMPLE
       hora num1 num2
   #>
   
   
   $hora = $(Get-Date).Hour
   $dia = $param1 -$param2
   Write-Host "la hroa es $hora y el numero es $dia"
}



  Function Sumar ($x, $y) {
    $sumar = $x + $y
    Write-Host “La respuesta es $sumar”
  }

  Function Fecha { Get-Date }

  function tortilla 
  {
      param(
        [Parameter(Mandatory=$true)] [string] $ingr1,
        [Parameter(Mandatory=$true)] [string] $ingr2,
        [Parameter(Mandatory=$true)] [string] $ingr3
      ) 

      Write-Host "La tortilla lleva $ingr1, $ingr2 y $ingr3"
  }
  tortilla cebolla patata huevo

  function accion ($param1, $param2)
{
    Write-host "estmos dentro de la funcion"
}


Write-host "Este es el CSV $csv y este es el log $log"
accion $csv $log
Write-host "Seguimos ejecutando la estructura del script despues de la ejecución de la función"
Write-host "Si volvemos a invocar la función volverá a ser ejecutada."

accion 

function Multiplicar {
    param(
        [int]$A,
        [int]$B
    )
    return ($A * $B)
}

# Guardamos el resultado en una variable
$Resultado = Multiplicar -A 4 -B 3
Write-Host "El resultado es $Resultado"
