#Importar el modul neecessari per instal·lar Active Directory amb els seus complements.
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

#Per promocionar el servidor a controlador de domini, primer hem d’importar el mòdul que conté els cmdlets d'Active Directory
Import-Module ADDSDeployment
#Instal·lar modul de Install-ADDSForest
Install-ADDSForest

#Mostrar informació del domini.
Get-AdDomain


