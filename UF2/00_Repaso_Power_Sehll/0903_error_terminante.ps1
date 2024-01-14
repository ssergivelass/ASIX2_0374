try
{
    
    Start-Something2("lunes","14")
}
catch
{
    Write-Output "Something threw an exception"
    Write-Output $_
}

