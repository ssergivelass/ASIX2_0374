$nombre = "sergio"
$cognom =  "velasco"
#amb  [n], escollim la posició del valor de la varibale que volgueml
$login = "$($nombre[0])$cognom"
Write-host  $login
#amb $(Get-ADDomain). escollim el parametre que necessitem, en aquest cas el domin en format dc.dc
$domini = $(Get-ADDomain).DNSRoot
$correo = "$nombre.$cognom@$domini"
Write-host $correo
