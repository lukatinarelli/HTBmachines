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
  <img alt="Shell Script" src="https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white">
  <img alt="JSON" src="https://img.shields.io/badge/json-5E5C5C?style=flat&logo=json&logoColor=white">
  <img alt="HTB" src="https://img.shields.io/badge/HackTheBox-111927?style=flat&logo=Hack%20The%20Box&logoColor=9FEF00">
</p>

# Índice
* [Introducción](#-introducción)
* [Características](#-características)
* []
* []
* [Licencia](#licencia)

# 📜 Introducción
HTBMachines es un script diseñado para buscar información detallada sobre máquinas de Hack The Box, VulnHub y PortSwigger. Este proyecto se basa en la base de datos y tutoriales proporcionados por @S4vitar.

# 🔨 Características
- Búsqueda de máquinas por nombre (`-m`, `--machine`).
- Actualización del archivo `infosecmachines.json` (`-u`, `--update`).
- Información del script y ayuda (`-h`, `--help`).
- Versión del script (`-v`, `--version`).
- Autocompletado opcional para la flag `-m`.

# Instalación
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

