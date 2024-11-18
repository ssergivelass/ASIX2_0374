# Manipulació de recursos compartits, gestió depermisos PCC i NTFS de directoris

#Creació de directoris, dos opcions o amb comandaments de cmd o bé amb comandaments de cmdlets.
mkdir c:\compartida
New-Item -Path c:\compartida\ASIX2 -ItemType Directory
New-Item -Path c:\compartida\ASIX2\M6 -ItemType Directory

#Mostrar els permisos per un directori determinat.
Get-Acl -Path c:\compartida\ASIX2 | fl
#Podem filtrar les sortides de comandes segons la dada que nosaltres necessitem:
$(Get-Acl -Path c:\compartida\ASIX2).Owner
(Get-Acl -Path c:\compartida\ASIX2).Owner

#Amb icacls també podem veure els permisos d'un directori.
icacls c:\compartida\

#Eliminar la herencia de un directorio manteniendo los objetos:
icacls c:\compartida /inheritancelevel:d

#Eliminar els permisos per defecte 
icacls c:\compartida /remove "BUILTIN\Usuarios"
icacls c:\compartida



#Mostrar si un directori te activa l'herencia.
$acl = Get-Acl -Path c:\compartida\ASIX2
$acl.AreAccessRulesProtected

#Crear un nou usuari
$contra = ConvertTo-SecureString “QWEqwe123" -AsPlainText -Force
New-ADUser -Name "severo" -SamAccountName "severo" -AccountPassword $contra  -Enabled $false
Get-ADUser severo

#Passos per l'assignació de permisos a un directori
# Obtiene la ACL actual de la carpeta especificada.
$dir = Get-Acl -Path C:\compartida\ASIX2

# Crea una nueva regla de acceso (solo lectura) para el grupo GG_P_ASIX1.
$nuevopermiso = New-Object System.Security.AccessControl.FileSystemAccessRule("severo", "Write", "Allow")

# Añade la nueva regla de acceso a la ACL obtenida.
$dir.SetAccessRule($nuevopermiso)

# Aplica la ACL modificada a la carpeta, actualizando sus permisos.
$dir | Set-Acl -Path C:\compartida\ASIX2


#Compartició d'un recurs

#Veure els recursos compartits del servidor:
Get-SmbShare

#Agregar nuevo recurso compartido.
New-SmbShare -Name compartida_asix2 -Path "C:\compartida\ASIX2" -FullAccess severo
#Ver los usuarios que tienen acceso.
Get-SmbShareAccess -Name compartida_asix2
#Añadir nuevo usuario
Grant-SmbShareAccess -Name compartida_asix2 -AccountName severo -AccessRight Read
#Borrar recurso
Remove-SmbShare -Name compartida_asix2

#Aplicar permisos solo a subcarpetas y archivos (no al directorio raíz):
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

#Aplicar permisos a esta carpeta, subcarpetas y archivos (sin detener la herencia):
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

#Aplicar permisos y detener la herencia:
#Uso de NoPropagateInherit para que los permisos no se propaguen más allá de un nivel.

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