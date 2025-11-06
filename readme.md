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

## 📚 Índice
- [Introducción](#-introducción)
- [Características](#-características)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Créditos](#-créditos)
- [Licencia](#%EF%B8%8F-licencia)

---

## 📜 Introducción
HTBMachines es un **potente *script* en Bash** diseñado para **consultar información detallada** sobre máquinas de Hack The Box, VulnHub y PortSwigger. Este proyecto se basa en la base de datos y tutoriales proporcionados por el trabajo de **[@S4vitar](https://github.com/S4vitar)**.

---

## 🔨 Características
* Búsqueda de máquinas por nombre (`-m`, `--machine`).
* Actualización del archivo `infosecmachines.json` (`-u`, `--update`).
* Información del *script* y ayuda (`-h`, `--help`).
* Versión del *script* (`-v`, `--version`).
* Autocompletado opcional.

---

## 💾 Instalación

### Dependencias:
* `curl`
* `jq`
* `md5sum`
* `tput`
* `figlet`

### Instrucciones:
```bash
# Clonar el repositorio
git clone https://github.com/lukatinarelli/HTBmachines.git
cd HTBmachines

# Dar permisos de ejecución
chmod +x htbmachines.sh
```

> [!TIP]
> Puedes añadir la ruta del repo en tu **PATH** para ejecutar el script con `htbmachines.sh` desde cualquier directorio.

### Autocompletado (opcional)
Si quieres autocompletado usa el siguiente comando:

```Bash
source .htb-autocomplete
```

> [!NOTE]
> Si quieres el autocompletado permanente, añade `source .htb-autocomplete` a tu `~/.zshrc` o `~/.bashrc`.

---

## 🚀 Uso

| Argumento Corto | Argumento Largo | Descripción |
| :-------------: | :-------------: | :---------- |
| `-m` | `--machine` | Busca información detallada sobre una máquina de HTB, VulnHub o PortSwigger. |
| `-u` | `--update` | Actualiza el archivo de datos principal (`infosecmachines.json`). |
| `-h` | `--help` | Muestra el menú de ayuda e información del script. |
| `-v` | `--version` | Muestra la versión actual del script. |

---

## 🌟 Créditos

Este script se creó como parte del **curso de Hack4U** impartido por **[@S4vitar](https://github.com/S4vitar)**. La base de datos y los tutoriales utilizados son propiedad intelectual de **@S4vitar**.

> [!CAUTION]
> **Nota Importante:** Este proyecto está destinado exclusivamente para **fines educativos** en el contexto del **Hacking Ético**.

---

## ⚖️ Licencia
Este proyecto está bajo la [Licencia MIT](LICENSE).
