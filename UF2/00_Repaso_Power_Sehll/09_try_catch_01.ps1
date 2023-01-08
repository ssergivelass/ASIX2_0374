#Sentencia simplificada Try/catch
try
{
    # Si s'especifica -ErrorAction Stop, Write-Error genera un error de terminació que es pot controlar amb catch.
    Start-Something -ErrorAction Stop
}
catch
{
    #Mostrem un missatge d'exepció per consola.
    Write-Output "Something threw an exception or used Write-Error"
    #Mostrem la informació sobre l'exepció amb $_
    Write-Output $_
    #Redirigim el missatge d'exepció un fitxer de registre.
    Write-Output "Something threw an exception or used Write-Error" >> C:\error.txt
    Write-Output $_ >> C:\trycatch.txt
}

# Sentencia Try/Catch/finally, especificant tipus d'Excepció
try
{
    Get-Content C:\error2.txt -ErrorAction Stop
    Get-Content C:\error1.txt -ErrorAction Stop
    Get-Content C:\error0.txt -ErrorAction Stop
    Get-LocalUser hans -ErrorAction Stop

}
#Pot ser selectiu amb les excepcions que es capturi. 
#Les excepcions tenen un tipus i pot especificar el tipus d'excepció que desitja capturar.
catch [Microsoft.PowerShell.Commands.UserNotFoundException]
{
    Write-Output "error, usuario no encontrado"
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-Output "error, No se encuentra el fichero."
    Write-Output $_
}
catch
{
    Write-Output "Algo ha lanzado una exepción de error."
    Write-Output $_
}
finally
{
 #A vegades, no és necessari controlar un error, però sí que és necessari executar codi tant si es produeix una excepció com si no. 
 #Un script finally fa exactament això.
 Write-Host "se ha acabado de ejecutar el script"
}