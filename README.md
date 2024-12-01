
```markdown
# PC-Bad: Simulador de Diagnóstico Técnico en Batch

**PC-Bad** es un script en **Batch** diseñado para simular un diagnóstico técnico continuo en una computadora. Este script muestra mensajes creíbles de progreso técnico y abre ventanas interactivas para representar análisis de bajo nivel del sistema. Es útil para simular procesos técnicos prolongados y justificados.

---

## 🖥️ **Características**

- **Identificación única:** Genera un número aleatorio para identificar el sistema.
- **Mensajes de diagnóstico técnico:** Proporciona información que simula un análisis avanzado.
- **Ventanas interactivas:** Abre ventanas CMD con comandos como `netstat`, `tree`, `tasklist`, etc., para simular un monitoreo activo.
- **Pantalla principal inmersiva:** Se ejecuta en pantalla completa para dar un aspecto profesional.
- **Ciclo continuo:** Diseñado para ejecutarse indefinidamente hasta que sea detenido manualmente.

---

## 🚀 **Cómo Usarlo**

1. **Descarga el archivo:** Obtén el script `fixmula-pcbad.bat` desde este repositorio.
2. **Ejecuta el script:**
   - Haz clic derecho en el archivo y selecciona **Ejecutar como administrador**.
   - Esto asegura que las funciones avanzadas del script funcionen correctamente.
3. **Monitorea el diagnóstico:**
   - La ventana principal mostrará mensajes de progreso.
   - Se abrirán ventanas CMD adicionales que ejecutan comandos inofensivos para aumentar la credibilidad.

---

## 🔧 **Personalización**

### Cambiar mensajes técnicos
Puedes editar los mensajes de error o progreso técnico:
```batch
set "errores=Error crítico en el disco;Error al acceder al sistema de archivos;Timeout al conectar con el servidor;Falla en la autenticación de usuario;Error de escritura en registro;Pérdida de conexión de red;Fallo del sistema operativo"
```

### Ajustar comandos de las ventanas secundarias
Personaliza los comandos que se ejecutan:
```batch
set "comandos_aleatorios=netstat -ano;tree;tasklist;ipconfig;dir;ping localhost"
```

### Configurar la duración entre ciclos
Ajusta el tiempo de espera en segundos:
```batch
timeout /t 60 >nul
```

---

## ⚠️ **Advertencias**

- Este script es **completamente inofensivo** y no realiza modificaciones reales en el sistema.
- **Uso responsable:** No lo uses para engañar de manera malintencionada o en entornos donde no tengas permiso.
- Es ideal para pruebas, simulaciones o demostraciones técnicas.

---

## 📂 **Estructura del Código**

### Funciones principales
1. **Identificación única del sistema:**
   Genera un identificador único con:
   ```batch
   set /a PC_ID=%random%%random%
   ```

2. **Mensajes de progreso técnico:**
   Simula un diagnóstico con mensajes creíbles.

3. **Ventanas interactivas:**
   Abre y cierra ventanas CMD con comandos reales:
   ```batch
   start "DIAGNÓSTICO" cmd /c ^
       "color %random:~-1%F & mode con: cols=50 lines=15 & echo Ejecutando: !comando! & !comando! & timeout /t 10 >nul"
   ```

4. **Pantalla completa:**
   Garantiza una experiencia inmersiva:
   ```batch
   powershell -Command "& {Add-Type -Name WinAPI -Namespace Win32 -MemberDefinition '[DllImport(\"user32.dll\")]\public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")]\public static extern IntPtr GetConsoleWindow();' -PassThru | Out-Null; $consolePtr = [Win32.WinAPI]::GetConsoleWindow(); [Win32.WinAPI]::ShowWindowAsync($consolePtr, 3)}"
   ```

---

## 📜 **Licencia**

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más información.

---

## 📧 **Contacto**

- **Autor:** Nahuel Espinoza  
- **LinkedIn:** [Nahuel Espinoza](https://www.linkedin.com/in/nahuel-espinoza)

