#########################################################################
# Version 01                                                            #
# Creació de l'estructura d'OUs, grups i usuaris a Active Directory     #
# Autor: Sergio Velasco                                                 #
# Fecha: 12/11/2024                                                     #
#########################################################################


#Creació OU mare
New-ADOrganizationalUnit -Name Gestio -Path "DC=m6ad,DC=local" -ProtectedFromAccidentalDeletion $false
#Creació OUs filles.
New-ADOrganizationalUnit -Name Marketing -Path "OU=Gestio,DC=m6ad,DC=local" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name RRHH -Path "OU=Gestio,DC=m6ad,DC=local" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name Finanzas -Path "OU=Gestio,DC=m6ad,DC=local" -ProtectedFromAccidentalDeletion $false

#Mostra les OUs del domini, sense filtrar.
Get-ADOrganizationalUnit -Filter *
#Filtrar per una propietat en concret. Name i mostrant els resultats en foramt llista.
Get-ADOrganizationalUnit -Filter "Name -eq 'RRHH'" | fl *
#Filtrar per una ubicació en concret.i mosrant els resultats en format taula
Get-ADOrganizationalUnit -Filter * -SearchBase "OU=Gestio,DC=m6ad,DC=local" | ft Name,Country,PostalCode,City,StreetAddress,State

#Usuaris
#Creació usuaris
New-ADUser -Name "Joan Martínez" -SamAccountName "jmartinez" -DisplayName "Joan Martínez" -AccountPassword (ConvertTo-SecureString "ContrasenyaSegura123!" -AsPlainText -Force) -Path "OU=RRHH,OU=Gestio,DC=m6ad,DC=local" -Enabled $true -ChangePasswordAtLogon $true -CannotChangePassword $false -PasswordNeverExpires $false

#Mostrar Usuari creat
Get-ADUser -Filter "SamAccountName -eq 'jmartinez'" | fl *
Get-ADUser -Identity 'jmartinez' | fl *

#Craeció de grups
New-ADGroup -Name "RecursosHumanos" -GroupScope Global -GroupCategory Security -SamAccountName "RecursosHumanos" -Path "OU=RRHH,OU=Gestio,DC=m6ad,DC=local" -Description "Grup de seguretat per al departament de Recursos Humans"

#Mostrar Grup creat
Get-ADGroup -Identity "RecursosHumanos" | fl

#Afegim l'usuari al grup
Add-ADGroupMember -Identity "RecursosHumanos" -Members jmartinez

#Mostrem els usuaris del grup
Get-ADGroupMember -Identity "RecursosHumanos"

#Si afegim nous usuaris
New-ADUser -Name "Christian Lopez" -SamAccountName "clopez" -DisplayName "Christian Lopez" -AccountPassword (ConvertTo-SecureString "ContrasenyaSegura123!" -AsPlainText -Force) -Path "OU=RRHH,OU=Gestio,DC=m6ad,DC=local" -Enabled $true -ChangePasswordAtLogon $true -CannotChangePassword $false -PasswordNeverExpires $false
New-ADUser -Name "Raul Dominguez" -SamAccountName "rdominguez" -DisplayName "Raul Dominguez" -AccountPassword (ConvertTo-SecureString "ContrasenyaSegura123!" -AsPlainText -Force) -Path "OU=RRHH,OU=Gestio,DC=m6ad,DC=local" -Enabled $true -ChangePasswordAtLogon $true -CannotChangePassword $false -PasswordNeverExpires $false

#Mostrem els dos usuaris creats
Get-ADUser -Identity rdominguez
Get-ADUser -Identity clopez

#Agegim massiavament els usuaris creats
Add-ADGroupMember -Identity "RecursosHumanos" -Members rdominguez,clopez

#Mostrem els usuaris del grup
Get-ADGroupMember -Identity "RecursosHumanos"

