$nombre = "sergio"
$cognom =  "velasco"
$login = "$($nombre[0])$cognom"
Write-host  $login
$domini = $(Get-ADDomain).DNSRoot
$correo = "$nombre.$cognom@$domini"
Write-host $correo
