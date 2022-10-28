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

#////////////////////////////////////////////

#Sentencia While
$i=1
#Este bulque, mientras se cumpla la condicion, va a estar activo.
#En este caso la condicion es que $i sea menor (-lt) que 11
while($i -lt 11){
#dentro del while, la variable $i incrementarà en uno.
$i
$i++
}

#############################################
#Realizaremos ahora lo mismo pero mediante un do-while
#va a estar activo mientras se cumpla la condicion
#Es otra manera de componer el bulce condicional.
$i=2
do{
$i
$i++
}while($i -lt 11)


##############
#Veamos ahora, el bucle for.
#En este caso inicializamos la variable ya dentro de la sentencia condicional.

for($i=1;$i -lt 11;$i++)
{
$i
}

#BUCLE FOREACH
#En este caso vemos como inicializamos la variable y la ponemos entre dos rangos.
#Y entrará tantatas veces como numeros haya entre los dos rangos
foreach($i in 10..15)
{
$i
}
#Forma abreviada de mostrar el FOREACH
4..8 | % {$_}

#####

#SWITCH
#Declaramos una variable y le asignamos un valor.
$a=6
#Con el condicional Switch, comprobaremos si hay alguna opcion que se iguale con el valor.
switch($a){
    5{
        Write-Host "5"
        break
    }
    a{
        Write-Host " has escogido el 6"
        break
    }
    7{
        Write-Host "7"
        break
    }

#FUNCIONES
#Declaramos una funcion, la utilizaremos duespés cuando sea llamada.
function RequestName {
$Name = Read-Host "Entra tu nombre"
Write-Output "Your name is: ${Name}"
}
Clear
Get-Date
#En este punto del codigo hacemos referencia a la funcion  que hemos declarado al pricipio del script.
RequestName