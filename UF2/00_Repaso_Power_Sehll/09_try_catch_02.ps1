# Nom del fitxer que es vol llegir
$fitxer = "C:\fitxer.txt" -ErrorAction Stop

try {
    # Intentem llegir el fitxer
    $contingut = Get-Content $fitxer -ErrorAction Stop
    # Mostrem el contingut del fitxer per pantalla
    Write-Output $contingut
} catch [System.IO.FileNotFoundException] {
    # Si es produeix un error de tipus FileNotFoundException, mostrem un missatge d'error
    Write-Output "No s'ha trobat el fitxer especificat"
} catch {
    # Si es produeix qualsevol altre tipus d'error, mostrem un missatge d'error genèric
    Write-Output "S'ha produït un error en la lectura del fitxer"
}
