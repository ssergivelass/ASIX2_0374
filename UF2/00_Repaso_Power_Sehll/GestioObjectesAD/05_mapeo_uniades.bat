@echo off
REM ============================================
REM  Script mapeo de unidades de red
REM  Para usar con perfiles de Active Directory
REM ============================================

REM Eliminar mapeos previos
net use P: /delete /yes 
net use H: /delete /yes 

REM Unidad de red compartida (para todos los usuarios)
net use H: \\SERVIDOR\Compartido /persistent:no

REM Unidad personal (carpeta con el nombre del usuario)
net use P: \\SERVIDOR\Usuarios\%USERNAME% /persistent:no

