$nombre = "sergio"
$cognom =  "velasco"
#amb  [n], escollim la posició del valor de la varibale que volgueml
$login = "$($nombre[0])$cognom"
Write-host  $login
#Podem mostrar i/o emmagatzemar a una variable el resultat d'un cmdlet
#llistem el resultat d'un cmdlet, en aquest 
Get-Date | fl *
#Si ho empaquetem d'aquesta manera podem recollir un valor del cmdlet.
(Get-Date).Day
#amb $(Get-ADDomain). escollim el parametre que necessitem, en aquest cas el domin en format dc.dc
$domini = $(Get-ADDomain).DNSRoot
$correo = "$nombre.$cognom@$domini"
Write-host $correo
