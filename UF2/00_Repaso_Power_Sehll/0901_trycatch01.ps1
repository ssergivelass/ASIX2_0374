try {
    $fitxer = "C:\fitxer3.txt"
    # Intentem llegir el fitxer
    $contingut = Get-Content $fitxer -ErrorAction Stop
    # Mostrem el contingut del fitxer per pantalla
    Write-Output $contingut
} catch [System.Management.Automation.ItemNotFoundException] {

    #System.IO.FileNotFoundException
    # Si es produeix un error de tipus FileNotFoundException, mostrem un missatge d'error
    Write-Output "No s'ha trobat el fitxer especificat"
    Write-Output "Este es el error" $_
    Write-Output "Otro modo de llamar al errorS" $PSItem
    Write-Output "Esta variable contiene todos los errores compilados, al colocar 0 llama 
    al posición primera" $Error[0]
    }
catch {
    # Si es produeix qualsevol altre tipus d'error, mostrem un missatge d'error genèric
    Write-Output "S'ha produït un error en la lectura del fitxer"
}
finally {
     Write-Output "Final d'execució"
     #$Error

}