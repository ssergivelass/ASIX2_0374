try
{
    # Obtiene la ACL actual de la carpeta especificada.
    $dir = Get-Acl -Path C:\EMPRESA\Justificantes -ErrorAction Stop
    Write-Host "fin"
    $jefes = New-Object System.Security.AccessControl.FileSystemAccessRule("GG-JefesDep","Write", "Allow")
    $dir.SetAccessRule($jefes)
    $dir | Set-Acl -Path C:\EMPRESA\Justificantes
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-Output "No existe el directorio"
    Write-Output $_
}
catch [System.Security.Principal.IdentityNotMappedException]
{
    Write-Output "Algun objeto no existe"
    Write-Output $_
}
catch 
{
    Write-Output "Hay otro problema"
    Write-Output $_
}

