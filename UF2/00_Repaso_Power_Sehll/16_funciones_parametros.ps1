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

#Uso de parámetro MANDATORY
# ---------------------------------------------
# Esta función pide dos datos: un nombre (texto) y una edad (número).
# Ambos son parámetros obligatorios. Si el usuario no los indica al llamar
# a la función, PowerShell los solicitará automáticamente.
# ---------------------------------------------

function Saludar {

    # Activa las características avanzadas de PowerShell.
    # Esto convierte la función en una "función avanzada",
    # lo que permite usar validaciones y parámetros como los cmdlets del sistema.
    [CmdletBinding()]

    # Definimos los parámetros que la función necesita para funcionar.
    param(

        # Primer parámetro: 'Nombre'
        # - 'Mandatory = $true' indica que es obligatorio.
        # - '[string]' indica que debe ser texto.
        [Parameter(Mandatory = $true)]
        [string]$Nombre, 

        # Segundo parámetro: 'edad'
        # - 'Mandatory' (sin = $true) también se interpreta como "obligatorio".
        # - '[int]' indica que el valor debe ser un número entero.
        [Parameter(Mandatory)]
        [int]$edad
    )

    # Mostramos un mensaje personalizado en pantalla.
    # En este ejemplo, usamos solo el nombre, pero podríamos incluir la edad también.
    Write-Host "¡Hola, $Nombre! Espero que tengas un gran día 😊"
}

# ---------------------------------------------
# EJECUCIÓN DE LA FUNCIÓN
# ---------------------------------------------

# Aquí llamamos a la función SIN pasar los parámetros.
# Como ambos son obligatorios, PowerShell pedirá que el usuario los introduzca uno por uno.
Saludar


