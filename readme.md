# HTBmachines

Script en Bash para consultar información de máquinas de Hack The Box a partir del archivo `infosecmachines.json`.

## Características
- Búsqueda de máquinas por nombre (`-m`, `--machine`).
- Actualización del archivo `infosecmachines.json` (`-u`, `--update`).
- Información del script y ayuda (`-h`, `--help`).
- Versión del script (`-v`, `--version`).
- Autocompletado opcional para la flag `-m`.

## Instalación
```bash
# Clonar el repositorio
$ git clone https://github.com/lukatinarelli/HTBmachines.git
$ cd HTBmachines

# Dar permisos de ejecución
$ chmod +x htbmachines.sh
```

## Uso
```bash
# Buscar una máquina
$ ./htbmachines.sh -m <nombre>

# Actualizar el archivo de datos
$ ./htbmachines.sh -u

# Mostrar ayuda
$ ./htbmachines.sh -h

# Mostrar versión
$ ./htbmachines.sh -v
```

## Autocompletado (opcional)
Si quieres autocompletado en la flag `-m`, añade lo siguiente a tu `~/.zshrc` o `~/.bashrc`:
```bash
source /ruta/al/archivo/.htb-autocomplete
```
Luego recarga la configuración:
```bash
$ source ~/.zshrc   # o ~/.bashrc
```

## Versión
**v1.0** - Primera versión funcional.

## Licencia
MIT License.

