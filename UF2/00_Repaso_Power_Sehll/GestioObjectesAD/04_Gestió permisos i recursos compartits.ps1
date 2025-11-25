# Manipulació de recursos compartits, gestió depermisos PCC i NTFS de directoris

#Creació de directoris, dos opcions o amb comandaments de cmd o bé amb comandaments de cmdlets.
mkdir c:\compartida
New-Item -Path c:\compartida\ASIX2 -ItemType Directory
New-Item -Path c:\compartida\ASIX2\M6 -ItemType Directory

#Mostrar els permisos per un directori determinat.
Get-Acl -Path 'C:\tmp\ASIX2'
Get-Acl -Path 'C:\tmp\ASIX2' | fl *
#Podem filtrar les sortides de comandes segons la dada que nosaltres necessitem:
$(Get-Acl -Path c:\compartida\ASIX2).Owner
(Get-Acl -Path c:\compartida\ASIX2).Owner
(Get-Acl -Path 'C:\tmp\ASIX2').Owner
#Amb icacls també podem veure els permisos d'un directori.
icacls c:\compartida\
# Per veure major informació sobre icacls --> icacls /?
#els drets d'herència poden precedir a qualsevol forma i s'apliquen només a directoris:
#(OI) - herència d'objecte
#(CI) - herència de contenidor
#(IO) - només herència
#(NP) - no propagar herència
#(I) - permís heretat del contenidor principal

#1. Eliminar la herencia d'un directori mantenint els objetos:
icacls c:\compartida /inheritancelevel:d

#    /inheritance:e|d|r
#        e - habilita la herencia
#        d - deshabilita la herencia y copia las ACE
#        r - quita todas las ACE heredadas

#2. Eliminar els permisos per defecte 
icacls c:\compartida /remove "BUILTIN\Usuarios"
icacls c:\compartida

#Mostrar si un directori te activa l'herencia.
$acl = Get-Acl -Path c:\compartida\ASIX2
$acl.AreAccessRulesProtected

#Crear un nou usuari
$contra = ConvertTo-SecureString “QWEqwe123" -AsPlainText -Force
New-ADUser -Name "severo" -SamAccountName "severo" -AccountPassword $contra  -Enabled $false
Get-ADUser severo

#3. Passos per l'assignació de permisos a un directori (Gestió Permisos NTFS)
# 3.1. Obté la ACL actual de la carpeta especificada.
$dir = Get-Acl -Path C:\compartida\ASIX2

# 3.2. Crea una nova regla d'accés (només lectura) per al grup GG_P_ASIX1.
$nuevopermiso = New-Object System.Security.AccessControl.FileSystemAccessRule("severo", "Write", "Allow")

# 3.3. Afegeix la nova regla d'accés a la ACL obtinguda.
$dir.SetAccessRule($nuevopermiso)

# 3.4. Aplica la ACL modificada a la carpeta, actualitzant els seus permisos.
$dir | Set-Acl -Path C:\compartida\ASIX2


#4. Compartició d'un recurs (PCC)

#Veure els recursos compartits del servidor:
Get-SmbShare

#4.1. Agregar nou recurs compartit.
New-SmbShare -Name compartida_asix2 -Path "C:\compartida\ASIX2" -FullAccess severo
#Veure els usuaris que tenen accés.
Get-SmbShareAccess -Name compartida_asix2
#4.2. fegir nou usuari
Grant-SmbShareAccess -Name compartida_asix2 -AccountName severo -AccessRight Read
#Borrar recursos
Remove-SmbShare -Name compartida_asix2

# CONTROL DE PROPAGACIÓ DE PERMISOS:
#1. Aplicar permisos sol a subcarpetas i arxius (no al directori arrel):
$ACL = Get-ACL -Path C:\compartida\ASIX2
$AccesRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "severo",
    "ReadAndExecute",
    "ContainerInherit, ObjectInherit",
    "InheritOnly",
    "Allow"
)
$ACL.SetAccessRule($AccesRule)
$ACL | Set-Acl -Path C:\compartida\ASIX2


Get-Acl -Path C:\compartida\ASIX2\M6 | fl

#2. Aplicar permisos a aquesta carpeta, subcarpetas i arxius (sense detenir l'herència):
$ACL = Get-ACL -Path C:\compartida\ASIX2\
$AccesRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "severo",
    "Read,Write",
    "ContainerInherit, ObjectInherit",
    "None",
    "Allow"
)
$ACL.SetAccessRule($AccesRule)
$ACL | Set-Acl -Path C:\compartida\ASIX2

#3. Aplicar permisos i detenir l'herència:
#Ús de NoPropagateInherit perquè els permisos no es propaguin més enllà d'un nivell.

$ACL = Get-ACL -Path C:\compartida\ASIX2
$AccesRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "severo",
    "Read",
    "ContainerInherit, ObjectInherit",
    "NoPropagateInherit",
    "Allow"
)
$ACL.SetAccessRule($AccesRule)

$ACL | Set-Acl -Path C:\compartida\ASIX2



