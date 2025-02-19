get-date | fl * # Todos los parámetros de fecha
(Get-date).DayOfWeek # Dia de la semana en letra
Get-Date -Day 1 # mostrar el primer dia del mes.
(Get-Date).AddHours(2) #Añadir dos horas la fecha actual
(Get-Date).AddDays(1) # Añadimos un  dia a la fecha actual.
(Get-Date).AddMonths(1) # Añadimos un  dia a la fecha actual.
(Get-Date).AddDays(-1) #Podemos restar un dia a la fecha actual.

(Get-Date -Day 1).AddMonths(1).AddDays(-1) # Podemos hacer una convianción de todas ellas.
