# Monitor de Velocidad de Red con CommandRunner

Este proyecto incluye tres scripts en bash (`speed.sh`, `test.sh` y `open_terminal.sh`) para monitorear la velocidad de subida y bajada de una interfaz de red específica, con salida en tiempo real. Estos scripts están diseñados para usarse en conjunto con el applet **CommandRunner**.

## Requisitos

- **CommandRunner**: Applet necesario para configurar los comandos de monitorización. Puedes encontrar el applet en GitHub [aquí](https://github.com/linuxmint/cinnamon-spices-applets/tree/master/CommandRunner%40appdevsw).
- **nethogs**: Instalado para que `open_terminal.sh` pueda ejecutar la supervisión detallada del tráfico de aplicaciones en la red.

## Configuración y Uso

### Paso 1: Instalar CommandRunner
Descarga e instala el applet **CommandRunner** desde el [repositorio de GitHub](https://github.com/linuxmint/cinnamon-spices-applets/tree/master/CommandRunner%40appdevsw) o la tienda de aplicaciones de tu entorno de escritorio.

### Paso 2: Configuración de los Scripts

1. **Configurar la interfaz de red**:
   - Los scripts están predeterminados para monitorear la interfaz `wlp4s0`.
   - Si necesitas monitorear una interfaz diferente, abre la terminal y ejecuta:
     ```bash
     ip link show
     ```
   - Localiza el nombre de la interfaz de red deseada (por ejemplo, `eth0`, `wlan0`) y cambia el valor de `INTERFACE` en los scripts `speed.sh` y `test.sh` para reflejar este nombre.

### Paso 3: Configuración en CommandRunner

Dentro de CommandRunner:

- **Command**: Proporciona la ruta completa al script `speed.sh` (por ejemplo, `/home/usuario/speed.sh`). Este script mostrará la velocidad de subida y bajada en tiempo real en la barra del applet.
  
- **Click Command**: Proporciona la ruta completa a `open_terminal.sh` (por ejemplo, `/home/usuario/open_terminal.sh`). Este script abrirá `nethogs` en una nueva ventana de terminal para monitorear el tráfico de red de cada aplicación.

### Archivos

#### speed.sh
Monitorea la velocidad de subida y bajada en tiempo real para una interfaz de red. Si la velocidad supera los 1024 KB/s, convierte la medición a MB/s.

#### test.sh
Es similar a `speed.sh` pero está diseñado para ejecutarse en una terminal directamente, mostrando datos de red cada segundo en un bucle infinito.

#### open_terminal.sh
Ejecuta `nethogs` en una nueva ventana de terminal, mostrando el tráfico de red de cada aplicación en tiempo real.

## Ejecución Manual de los Scripts

Puedes ejecutar cualquiera de los scripts en la terminal directamente si deseas ver resultados fuera de CommandRunner:

```bash
# Ejecutar speed.sh en la terminal
bash /home/usuario/speed.sh

# Ejecutar test.sh en la terminal
bash /home/usuario/test.sh

# Ejecutar open_terminal.sh para abrir nethogs en una terminal
bash /home/usuario/open_terminal.sh
```


# Ejemplo de Uso

Cambia la variable INTERFACE en los scripts según tu interfaz de red.
Configura los scripts en CommandRunner como se describe en el paso 3.
Ejecuta speed.sh desde CommandRunner para ver la velocidad en la barra y haz clic para abrir nethogs con open_terminal.sh.