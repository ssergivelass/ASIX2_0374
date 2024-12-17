<#
 # En aquest script de PowerShell, 
 estem aplicant un filtre per obtenir 
 i mostrar en una llista tots els grups d'Active Directory (AD) 
 que compleixen una condició específica. L'explicació detallada és la següent:
#>

# Obtenim tots els grups d'Active Directory el nom dels quals comença amb "G-"
# Utilitzem el filtre 'Name -like "G-*"' per capturar només els noms desitjats
$grupos = $(Get-ADGroup -Filter 'Name -like "G-*"').Name

# Iniciem un bucle 'for' per recórrer tota la llista de noms de grups
for ($i = 0; $i -lt $grupos.Length; $i++)
{ 
    # Mostrem a la terminal cada nom de grup amb un índex numèric ordenat
    # "$($i+1)" és per començar la numeració en 1 en comptes de 0
    # "$($grupos[$i])" mostra el nom del grup actual en la posició $i
    Write-Host "$($i+1) - $($grupos[$i])"
}