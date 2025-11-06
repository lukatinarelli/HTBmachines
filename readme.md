<pre align="center">
██╗  ██╗████████╗██████╗ ███╗   ███╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗███████╗███████╗
██║  ██║╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝██╔════╝
███████║   ██║   ██████╔╝██╔████╔██║███████║██║     ███████║██║██╔██╗ ██║█████╗  ███████╗
██╔══██║   ██║   ██╔══██╗██║╚██╔╝██║██╔══██║██║     ██╔══██║██║██║╚██╗██║██╔══╝  ╚════██║
██║  ██║   ██║   ██████╔╝██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║███████╗███████║
╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
</pre>

<p align="center">
  <img src="https://img.shields.io/badge/STATUS-EN%20DESAROLLO-green">
  <img alt="GitHub License" src="https://img.shields.io/github/license/lukatinarelli/HTBmachines?style=flat&color=red">
<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/lukatinarelli/HTBmachines?style=flat&color=yellow">
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/lukatinarelli/HTBmachines">
</p>


Script en Bash para consultar información de máquinas de Hack The Box a partir del archivo `infosecmachines.json`.



## Características
- Búsqueda de máquinas por nombre (`-m`, `--machine`).
- Actualización del archivo `infosecmachines.json` (`-u`, `--update`).
- Información del script y ayuda (`-h`, `--help`).
- Versión del script (`-v`, `--version`).
- Autocompletado opcional para la flag `-m`.

## Instalación
Dependencias:
- curl
- awk
- js-beautify

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

## Licencia
MIT License.

