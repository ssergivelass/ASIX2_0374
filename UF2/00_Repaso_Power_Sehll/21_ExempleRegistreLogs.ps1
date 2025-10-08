$autorizados = Import-Csv "C:\temp\ps\usu.csv"
$log = "C:\temp\ps\registreacces.log"

$usuario = Read-Host "Introduce tu usuario"
$encontrado = $false
$data = Get-Date

foreach ($reg in $autorizados) {
    if ($reg.usuari -eq $usuario) {
        $encontrado = $true
        #Comrpobem quin nivell de permis tenen d'acces.
        if ([int]$reg.tipus -gt 1) #Si son administradors o tecnics.
        {
            #Registre en el log del casos favorables.
            $registre = "Usuario $($reg.usuari) autorizado. Nivel: $($reg.tipus) : Admins"
            Write-Host $registre
            "$data - SUCCESS - $registre" | Out-File -FilePath $log -Append

        }elseif([int]$reg.tipus -eq 1)#Si son usuaris basics. 
        {
            #Registre en el log del casos desfavorables.
            $registre = "Usuario $($reg.usuari) autorizado. Nivel: $($reg.tipus) : Standard"
            Write-Host $regisre
            "$data - DENIED - $registre" | Out-File -FilePath $log -Append
        }
    }
}
#Comprovació i registre usuaris inexistents.
if (-not $encontrado) {
    $regisre = "Usuario NO encontrado"
    Write-Host $regisre
    "$data - DENIED - $registre" | Out-File -FilePath $log -Append
}
