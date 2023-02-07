#Paso 1
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



#Paso 2
#Vamos a crear una tarea básica, para ello debemos usar la siguiente sintaxis:
$action = New-ScheduledTaskAction -Execute 'Programa'

<#

Paso 4

Si deseamos abrir una aplicación de un tercero, debemos registrar allí la ruta, por ejemplo, si deseamos abrir TeamViewer ejecutaríamos: 
#>
$Action = New-ScheduledTaskAction -Execute "C:\Program Files\Google\Chrome\Application\chrome.exe"

<#
Paso 5
El siguiente paso será crear la variable donde se integra la información del programa para la tarea a crear, esto hace referencia a la frecuencia para ejecutarla, allí usaremos el parámetro Trigger de la siguiente manera.
 # 
#>
$Trigger = New-ScheduledTaskTrigger -Once -At 10am

<#
Paso 6
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
Paso 9

Ahora debemos registrar la tarea para que esté disponible en el Programador de tareas, esto es posible con el cmdlet Register-ScheduledTask: 

En este punto hemos asignado el nombre de la tarea, visible en el Programador de tareas, y se ha añadido una descripción. Vemos como resultado que la tarea ha sido exitosa.
#>
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "Mis_Tareas_Programadas" -TaskName "AbreChrome" -Description "Abrir Chrome"

<#
Paso 11

Verificamos en la interfaz del programador de tareas que se haya creado la tarea descrita. Allí es posible ver la tarea activa según los criterios descritos.
 
#>

<#

Paso 12
Para eliminar la tarea cuando ya no sea más necesaria, vamos a listar la tarea a borrar con el siguiente comando: 
#>
Get-ScheduledTask -TaskPath '\Mis_Tareas_Programadas\'

<#
Paso 12

Para eliminar la tarea cuando ya no sea más necesaria, vamos a listar la tarea a borrar con el siguiente comando:
#>
Unregister-ScheduledTask -TaskName 'AbreChrome' -Confirm:$false
