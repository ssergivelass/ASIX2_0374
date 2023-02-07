#Paso 1 -  Listar todos los CMDLETS sobre SCHEDULEDTASK
#En primer lugar, vamos a listar las opciones del programador de tareas con el comando:
(Get-Command -Module ScheduledTasks).Name
<#
#Cada uno de estos cmdlets nos permite realizar una tarea específica asociada a la tarea.
Disable-ScheduledTask: desactiva una tarea programada existente.
Enable-ScheduledTask: activa una tarea programada existente.
Export-ScheduledTask: exporta una tarea programada a un archivo XML para su uso posterior.
Get-ClusteredScheduledTask: obtiene información sobre las tareas programadas registradas en un clúster de Windows Server.
Get-ScheduledTask: obtiene información sobre las tareas programadas existentes en un sistema Windows.
Get-ScheduledTaskInfo: obtiene información detallada sobre una tarea programada específica.
New-ScheduledTask: crea una nueva tarea programada.
New-ScheduledTaskAction: define la acción que se realizará en una tarea programada.
New-ScheduledTaskPrincipal: define la identidad que se utilizará para ejecutar una tarea programada.
New-ScheduledTaskSettingsSet: define los ajustes de una tarea programada.
New-ScheduledTaskTrigger: define el desencadenador que activará una tarea programada.
Register-ClusteredScheduledTask: registra una tarea programada en un clúster de Windows Server.
Register-ScheduledTask: registra una tarea programada en un sistema Windows.
Set-ClusteredScheduledTask: modifica las propiedades de una tarea programada registrada en un clúster de Windows Server.
Set-ScheduledTask: modifica las propiedades de una tarea programada existente.
Start-ScheduledTask: inicia una tarea programada.
Stop-ScheduledTask: detiene una tarea programada.
Unregister-ClusteredScheduledTask: elimina una tarea programada registrada en un clúster de Windows Server.
Unregister-ScheduledTask: elimina una tarea programada existente en un sistema Windows.
#>


<#
#Paso 2 - Crear Acción
#Vamos a crear una tarea básica, para ello debemos usar la siguiente sintaxis:
#$action = New-ScheduledTaskAction -Execute 'Programa'

Si deseamos abrir una aplicación de un tercero, debemos registrar allí la ruta, por ejemplo, si deseamos abrir Chrome ejecutaríamos: 
#>
$Action = New-ScheduledTaskAction -Execute "C:\Program Files\Google\Chrome\Application\chrome.exe"

<#
Paso 3 - Configurar el TRIGER -  al desencadenante
Esta sentencia crea un objeto que representa un desencadenador para una tarea programada en Windows.
El cmdlet New-ScheduledTaskTrigger se utiliza para crear un desencadenador, 
y la opción -Once indica que la tarea programada solo se ejecutará una vez.
La opción -At 10am especifica la hora a la que se ejecutará la tarea programada (10am, o 10:00 a.m.). 
#>
$Trigger = New-ScheduledTaskTrigger -Once -At 10am

<#
En este ejemplo la tarea solo se ejecuta de una vez a las 10 am, las opciones de Trigger disponibles son:
Opciones Trigger
 
On a Schedule: en base a una programación, en este caso debemos seleccionar los días, fecha y hora en la cual la tarea se lanzará
At log on: es una tarea que se ejecuta cuando el usuario inicia sesión en el equipo
At startup: este permite que la tarea se ejecute cal momento de iniciar el equipo
On idle: es una tarea que se ejecuta cuando el equipo está en un estado inactivo
On an evento: permite ejecutar la tarea cuando suceda un evento en el sistema
 # 
                     [Parameter(ParameterSetName='Daily')]
                    [Parameter(ParameterSetName='Logon')]
                    [Parameter(ParameterSetName='Once')]
                    [Parameter(ParameterSetName='Startup')]
                    [Parameter(ParameterSetName='Weekly')]
New-ScheduledTaskTrigger -Once -At <datetime> [-RandomDelay <timespan>] [-RepetitionDuration <timespan>] [-RepetitionInterval <timespan>] [-CimSession <CimSession[]>
] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
New-ScheduledTaskTrigger -Daily -At <datetime> [-DaysInterval <uint32>] [-RandomDelay <timespan>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<Comm
onParameters>]
New-ScheduledTaskTrigger -Weekly -At <datetime> [-RandomDelay <timespan>] [-DaysOfWeek <DayOfWeek[]>] [-WeeksInterval <uint32>] [-CimSession <CimSession[]>] [-Thrott
leLimit <int>] [-AsJob] [<CommonParameters>]
New-ScheduledTaskTrigger -AtStartup [-RandomDelay <timespan>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
New-ScheduledTaskTrigger -AtLogOn [-RandomDelay <timespan>] [-User <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
Paso 7
El campo -Once puede ser reemplazado por:
 
-Daily: diariamente
-Weekly: semanalmente
-Monthly: mensualmente
Paso 8 - NO HACER
Después de esto, vamos a crear la tarea programada usando el comando New-ScheduledTask, este permite aplicar la configuración:
$Settings = New-ScheduledTaskSettingsSet
#>

<#
Paso 4 - Registrar la tarea
Ahora debemos registrar la tarea para que esté disponible en el Programador de tareas, esto es posible con el cmdlet Register-ScheduledTask: 
En este punto hemos asignado el nombre de la tarea, visible en el Programador de tareas, y se ha añadido una descripción. Vemos como resultado que la tarea ha sido exitosa.
#>
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "severo" -TaskName "openChrome" -Description "Abrir Chrome"

<#
Paso 5 -  Ver en la GUI el resultado
Verificamos en la interfaz del programador de tareas que se haya creado la tarea descrita. Allí es posible ver la tarea activa según los criterios descritos.
 
#>

<#
Paso 6 -  Visualizar las opciones por comando
Para eliminar la tarea cuando ya no sea más necesaria, vamos a listar la tarea a borrar con el siguiente comando: 
#>
Get-ScheduledTask -TaskPath "\Mis_Tareas_Programadas\" 
Get-ScheduledTaskInfo -TaskName "Mis_Tareas_Programadas\AbrirChrome2"

<#
 Paso 7 - Exportar una tasca
 Get-Command Export-ScheduledTask -Syntax
#>
Export-ScheduledTask -TaskName 'AbreChrome' -TaskPath "\Mis_Tareas_Programadas\" > export.xml

<#
Paso 14 - Eliminar una tarea
Para eliminar la tarea cuando ya no sea más necesaria, vamos a listar la tarea a borrar con el siguiente comando:
#>
Unregister-ScheduledTask -TaskName 'AbreChrome' -Confirm:$false

<#
Paso 15 - Importar una tarea

Puedes importar una tarea XML en un sistema Windows mediante el uso del cmdlet Register-ScheduledTask y especificando el archivo XML como entrada.

El siguiente es un ejemplo de código que muestra cómo importar una tarea XML:

#>

#el cmdlet Out-String para convertir el contenido a una cadena antes de pasarlo a Register-ScheduledTask:
$xml = Get-Content -Path "C:\Users\Administrador.WIN-93TPJQ1C048\export.xml"  | Out-String
#Write-Host $xml
Register-ScheduledTask -Xml $xml -TaskName "AbrirChrome2" -TaskPath "\Mis_Tareas_Programadas"

