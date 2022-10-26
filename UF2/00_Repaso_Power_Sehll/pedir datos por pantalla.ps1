#Pedir por pantalla nombre
$nombre = Read-Host "Dime tu nombre "
#Pedir por pantalla año
$year = Read-Host "Que año naciste? "
#Comparación edad (año actual - año nacimiento)
$edad = 2022 - $year
#Lazar a consola resultado nombre y edad.
Write-Host $nombre "tienes" $edad
#Comparar con sentencia condicional IF si dos variables son exactamente igual.
$lista = Read-Host "Estas en la lista? A que nombre? "
if ($nombre -eq $lista)
{
    Write-Host $nombre " Correcto puedes pasar"
    # Condicion si la edad es mayor que 30.
    if ($edad -gt 30)
    {
        Write-Host "Ups..." $nombre " lo siento pero no tienes edad para entrar a Zoco"
    }else
    {
        Write-Host "A delante señor " $nombre
    }
}
else
{
    Write-Host "Lo siento " $nombre "pero no estas en la lista, no puedes pasar" 
}

#Solicitar dos variables del tipo numerico.
[Int] $numero1 = Read-Host "numero 1"
[Int] $numero2 = Read-Host "numero 2"
$suma = $numero1  * $numero2
Write-host "suma " $suma
#Asi no funciona, deberiamos hacer la operacion previamente y asignarlo a una variable
#tal y como se muestra en la linea de arriba.
Write-host "resta " $numero1 - $numero2
Write-host "division " $numero1 / $numero2
Write-host "multiplicacion " $numero1 * $numero2

#Diferencia entre Write-Host y Write-Out
$a = 'Testing Write-OutPut'  | Write-Output
$b = 'Testing Write-Host' | Write-Host

Get-Variable a,b

#Pedir por pantalla un dato e imprimirlo.
$Name = Read-Host "Enter your name"
Write-Output "Your name is: ${Name}"
Write-Host  "Your name is: ${Name}"

#trabajar con funciones.
function RequestName {
$Name = Read-Host "Enter your name"
Write-Output "Your name is: ${Name}"
}
RequestName

#Separar texto segun caracter
$texto = "Hola,que tal, me llamo,sergio"
$texto.Split(',')

#Crear Array numerica
$listanumeros = "123456"
#mostrar el caracter en la posicion 1
$listanumeros[1]