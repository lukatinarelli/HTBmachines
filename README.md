<pre align="center">
██╗  ██╗████████╗██████╗ ███╗   ███╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗███████╗███████╗
██║  ██║╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝██╔════╝
███████║   ██║   ██████╔╝██╔████╔██║███████║██║     ███████║██║██╔██╗ ██║█████╗  ███████╗
██╔══██║   ██║   ██╔══██╗██║╚██╔╝██║██╔══██║██║     ██╔══██║██║██║╚██╗██║██╔══╝  ╚════██║
██║  ██║   ██║   ██████╔╝██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║███████╗███████║
╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
</pre>

<p align="center">
  <img alt="Status" src="https://img.shields.io/badge/STATUS-EN%20DESARROLLO-green">
  <img alt="GitHub License" src="https://img.shields.io/github/license/lukatinarelli/HTBmachines?style=flat&color=red">
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/lukatinarelli/HTBmachines?style=flat&color=yellow">
  <img alt="Shell Script" src="https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white">
  <img alt="JSON" src="https://img.shields.io/badge/json-5E5C5C?style=flat&logo=json&logoColor=white">
  <img alt="HTB" src="https://img.shields.io/badge/HackTheBox-111927?style=flat&logo=Hack%20The%20Box&logoColor=9FEF00">
</p>

## 📚 Índice
- [Introducción](#-introducción)
- [Aviso Importante ⚠️](#%EF%B8%8F-aviso-importante-cambio-de-la-base-de-datos-api)
- [Características](#-características)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Créditos](#-créditos)
- [Licencia](#%EF%B8%8F-licencia)

---

## 📜 Introducción
HTBMachines es un **potente *script* en Bash** diseñado para **consultar información detallada** sobre máquinas de Hack The Box, VulnHub y PortSwigger. Este proyecto se basa en la base de datos y tutoriales proporcionados por el trabajo de **[@S4vitar](https://github.com/S4vitar)**.

---

## ⚠️ Aviso Importante: Cambio de la Base de Datos (API)

Este proyecto se concibió utilizando la API de **infosecmachines.io** (de [JavierMolines](https://github.com/JavierMolines/)), la cual permitía descargar la base de datos de máquinas sin autenticación.

> [!CAUTION]
> **CAMBIO RECIENTE.** El dominio `infosecmachines.io` ahora redirige a la nueva plataforma **hackingvault.com**. La API de la nueva web **NO permite la descarga de datos sin sesión iniciada.**

**Esto implica que:**
* El archivo `infosecmachines.json` **viene incluido en el repositorio** con la base de datos más reciente en el momento de la clonación. **No necesitas seguir estos pasos para usar el script.**
* La **autenticación es obligatoria si deseas actualizar la Base de Datos (`-u`, `--update`)** para obtener nuevas máquinas, ya que la API de Hacking Vault requiere tu *cookie* de sesión.

### 🔑 Instrucciones para Obtener el Token de Sesión

Para que el script funcione, debes proporcionar tu **cadena de *cookies*** de sesión. El proceso es el siguiente:

#### Copiar el comando cURL completo
Esta es la forma más robusta, ya que copia todas las cabeceras necesarias:

1.  Inicia sesión en **[hackingvault.com](https://hackingvault.com/)**.
2.  Abre F12 (Herramientas de Desarrollador) y ve a la pestaña **`Network`**.
3.  Filtra por **Fetch/XHR**.
4.  Busca la petición a `tutorials?page=X&limit=12` y haz clic derecho.
5.  Selecciona **`Copy`** > **`Copy as cURL (bash)`**.
6.  Al ejecutar el comando de actualización, el script te pedirá que pegues la cadena cURL en la consola.

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
Hemos separado la lógica en dos archivos para máxima compatibilidad y evitar bugs raros:

| Shell | Archivo a Usar |
| :---: | :--- |
| **Zsh** | `.htb-autocomplete.zsh` |
| **Bash** | `.htb-autocomplete.bash` |

Para habilitarlo, usa el siguiente comando con el archivo que corresponda a tu shell:
```bash
source .htb-autocomplete.<tu_shell>
```
#### Ejemplo: 
```bash
source .htb-autocomplete.zsh
```
> [!NOTE]
> Si quieres que el autocompletado sea permanente, añade la línea source correspondiente a tu archivo de configuración (`~/.zshrc` o `~/.bashrc`).

---

## 🚀 Uso

| Argumento Corto | Argumento Largo | Descripción |
| :-------------: | :-------------: | :---------- |
| `-m` | `--machine` | Busca información detallada sobre una máquina de HTB, VulnHub o PortSwigger. |
| `-i` | `--ip` | Buscar máquinapor dirección IP. |
| `-d` | `--difficulty` | Filtar máquinas por dificultad. |
| `-u` | `--update` | Actualiza el archivo de datos principal (`infosecmachines.json`). |
| `-h` | `--help` | Muestra el menú de ayuda e información del script. |
| `-v` | `--version` | Muestra la versión actual del script. |

---

## 🔧 Cosas por mejorar (Tareas)

Este es el *checklist* de funcionalidades y mejoras planificadas para las próximas versiones:

- [X] **Filtros:** Añadir más filtros como el de -os (sistema operativo), -d (dificultad)...
- [ ] **Autocompletado:** Solucionar el fallo al usar comillas en los nombres de máquina.
- [ ] **Ergonomía:** Implementar sugerencias de nombres ("¿Quieres decir: ...") si la máquina no es encontrada.
- [ ] **Metadatos:** Añadir un nuevo campo `resuelta` a la base de datos JSON.
- [X] **Documentación:** Mostrar la ayuda y el uso correcto para cada *flag* individual.
- [X] **UX (User Experience):** Añadir colores en la salida del comando de búsqueda (`-m`).
- [ ] **Mantenimiento:** Implementar un sistema básico de *logs*.
- [X] **Automatización:** Si al filtrar el resultado solo hay una máquina, mostrar la información de esa máquina automáticamente.
- [ ] **Interactivo:** Desarrollar un modo interactivo con lectura de teclado para navegación.

---

## 🌟 Créditos

Este script se creó como parte del **curso de Hack4U** impartido por **[@S4vitar](https://github.com/S4vitar)**. La base de datos y los tutoriales utilizados son propiedad intelectual de **S4vitar**.

> [!CAUTION]
> **Nota Importante:** Este proyecto está destinado exclusivamente para **fines educativos** en el contexto del **Hacking Ético**.

---

## ⚖️ Licencia
Este proyecto está bajo la [Licencia MIT](LICENSE).
