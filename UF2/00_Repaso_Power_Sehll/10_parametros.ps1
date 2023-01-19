Param([string]$nombre,[string]$dia)

#Write-Host "Hola $nombre, tienes $edad"

if ($nombre -and $dia)
{
    Write-Host "OK!!!!! - Has introducido los parametros esperados"
    Write-Host "Hola $nombre, hoy es $dia"  
    Write-Host "El primer argumento es " $args[0]  
}
else
{
    Write-Host "No has introducido los parametros esperados."
}