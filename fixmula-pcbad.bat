@echo off
title SISTEMA EN MODO DIAGNÓSTICO
color 0C
mode con: cols=120 lines=40

:: Generar un ID único para la PC
set /a PC_ID=%random%%random%
set "errores=Error crítico en el disco;Error al acceder al sistema de archivos;Timeout al conectar con el servidor;Falla en la autenticación de usuario;Error de escritura en registro;Pérdida de conexión de red;Fallo del sistema operativo"

:: Asegurar pantalla completa
powershell -Command "& {Add-Type -Name WinAPI -Namespace Win32 -MemberDefinition '[DllImport(\"user32.dll\")]\public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")]\public static extern IntPtr GetConsoleWindow();' -PassThru | Out-Null; $consolePtr = [Win32.WinAPI]::GetConsoleWindow(); [Win32.WinAPI]::ShowWindowAsync($consolePtr, 3)}"

:: Inicio del diagnóstico
cls
echo =============================================================
echo                  SISTEMA EN MODO DIAGNÓSTICO                
echo =============================================================
echo.
echo Identificación del Sistema: PC-%PC_ID%
echo Fecha y Hora de Inicio: %date% %time%
echo.
echo -------------------------------------------------------------
echo            * NO CIERRE ESTA VENTANA POR FAVOR *             
echo -------------------------------------------------------------
timeout /t 5 >nul

:: Simulación de diagnóstico continuo
:diagnostico
cls
echo =============================================================
echo                  SISTEMA EN MODO DIAGNÓSTICO                
echo =============================================================
echo.
echo Identificación del Sistema: PC-%PC_ID%
echo Fecha y Hora Actual: %date% %time%
echo.
echo -------------------------------------------------------------
echo Procesos en curso:
echo -------------------------------------------------------------
call :mostrar_progreso
call :mostrar_error_aleatorio
call :abrir_ventana_aleatoria
timeout /t 60 >nul
goto diagnostico

:: Mostrar barra de progreso
:mostrar_progreso
setlocal EnableDelayedExpansion
set "bar="
for /l %%A in (1,1,%random:~-1%) do set "bar=!bar!█"
for /l %%A in (%random:~-1%,1,100) do set "bar=!bar! "
echo [!bar!]  Diagnóstico en curso...
endlocal
exit /b

:: Mostrar errores aleatorios
:mostrar_error_aleatorio
setlocal EnableDelayedExpansion
for /f "tokens=%random:~-1% delims=;" %%A in ("%errores%") do (
    set "error=%%A"
)
echo [ERROR]: !error!
endlocal
exit /b

:: Abrir ventanas secundarias aleatorias
:abrir_ventana_aleatoria
setlocal EnableDelayedExpansion
set "comandos_aleatorios=netstat -ano;tree;tasklist;ipconfig;dir;ping localhost"
set "comando="
for /f "tokens=%random:~-1% delims=;" %%A in ("%comandos_aleatorios%") do (
    set "comando=%%A"
)
start "DIAGNÓSTICO" cmd /c ^
    "color %random:~-1%F & mode con: cols=50 lines=15 & echo Ejecutando: !comando! & !comando! & timeout /t 10 >nul"
endlocal
exit /b
