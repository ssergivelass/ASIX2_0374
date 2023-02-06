$message = "Numbers: "
foreach($number in 1..10)
{
    $message += " $number"
}
Write-Host $message

$lista = "uno,dos,tres"
$msn = "Numbers: "
foreach($nu in $lista -split ",")
{
    $msn += " $nu"
}
Write-Host $msn