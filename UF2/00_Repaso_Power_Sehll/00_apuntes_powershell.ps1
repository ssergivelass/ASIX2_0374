#Pedir algo por pantalla
Read-Host "Dime algo?"
#Almacenar en variable lo introducido por pantalla.
$tunombre = Read-Host "dime tu nombre"
$tunombre
#Operaciones aritméticas
#suma
$n01 = 10
$n02 = 2
$result = $n01+$n02
#resta
$n01-$n02
#divisiones
$n01/$n02
#multiplicacion
$n01*$n02

#Pedir numeros por pantalla y operar.
[Int] $n03 = Read-Host "primer numero"
[Int] $n04 = Read-Host "segundo numero"
$resultfinal = $n03/$n04

#Ecribir por pantalla texto + valor variable
Write-Host "el rsultado de la operacion es" $resultfinal

#Vamos pedir nuestro nombre y lo guardamos en una variable.
$minombre =  Read-Host "Dime tu nombre"
$myyear = Read-Host "Que año naciste?"

#Operacion aritmetica con constante.
$miedad = 2022 - $myyear
Write-Host "Tienes" $miedad "años"
$nombrelista = Read-Host " Estas en la lista? A que nombre?"
#con Ctr+J nos devuelve todas las estructuras cmdlet condicionales.
#Condicion if else simple

if ($nombrelista -eq $minombre)
{
<#
 # 
 Igualdad
•	-eq, , -ieq-ceq : es igual a
•	-ne, , -ine-cne , no es igual a
•	-gt, , : -igt-cgt mayor que
•	-ge, , : -ige-cge mayor o igual que
•	-lt, , -ilt-clt : menor que

#>

    Write-Host "OK, puedes pasar"
    if ($miedad -gt 30)
    {
        Write-Host "Ups... lo siento" $minombre ".. pero no tienes edad para entrar en Zoco"
    }
    else
    {
        Write-Host "Pasa pasa" $minombre ".. Te estaban esperando ;P"
    }
}
else
{
    Write-Host "Lo siento, no estas en la lista, no puedes pasar."
}

