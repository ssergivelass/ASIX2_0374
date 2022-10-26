#trabajar con funciones.
#Declaramos una funcion, la utilizaremos duespés cuando sea llamada.
function RequestName {
$Name = Read-Host "Entra tu nombre"
Write-Output "Your name is: ${Name}"
}
Clear
Get-Date
#En este punto del codigo hacemos referencia a la funcion  que hemos declarado al pricipio del script.
RequestName

enum Ciudades
{
    Hannover
    Madrid
    Seattle
    Barcelona
    London
    NewYork
}

function Seleccion-Ciudades
{
    param ([Ciudades][Parameter(Mandatory=$true)]$Ciudad)
    Write-Host "Has elegido la ciudad de $Ciudad"
}

Seleccion-Ciudades 3