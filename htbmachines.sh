#!/bin/bash
set -euo pipefail

# Colores
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
orangeColour="\e[0;38;5;208m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
blackColour="\e[0;38;5;236m\033[1m"
endColour="\033[0m\e[0m"

# Ctrl+C
function ctrl_c() {
    echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
    tput cnorm && exit 1
}
trap ctrl_c INT

# Dependencias
function checkDependencies() {
    for cmd in curl jq md5sum tput figlet; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo -e "\n${redColour}[!]${endColour} Falta la dependencia: $cmd. Instálala e inténtalo de nuevo."
            exit 1
        fi
    done
}
checkDependencies

# Variables globales
main_url="https://hackingvault.com/api/tutorials?page=1&limit=1000"
ruta="$(cd "$(dirname "$0")" && pwd)"


# Panel de ayuda
function helpPanel(){
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Modo de empleo: htbmachines.sh [-o sistema] [-d dificultad]... ${endColour}"
    echo -e "${yellowColour}[+]${endColour} ${grayColour}Buscador de máquinas de HTB.${endColour}"
    echo -e "\n${redColour}Ejemplos:${endColour}"
    echo -e "${grayColour}  htbmachines.sh -m 'Tentacle'${endColour}   ${turquoiseColour}# Buscar por nombre de máquina${endColour}"
    echo -e "${grayColour}  htbmachines.sh -d 'Easy'${endColour}       ${turquoiseColour}# Buscar por dificultad de máquina${endColour}"
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Opciones:${endColour}"
    echo -e "  ${purpleColour}m${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por nombre de máquina.${endColour}"

    #echo -e "\t${purpleColour}a${endColour}${turquoiseColour})${endColour} ${grayColour}Listar todas las máquinas.${endColour}"
    #echo -e "\t${purpleColour}i${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por dirección IP.${endColour}"
    #echo -e "\t${purpleColour}l${endColour}${turquoiseColour})${endColour} ${grayColour}Listar todas las direcciones IP.${endColour}"
    #echo -e "\t${purpleColour}o${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por el sistema operativo${endColour}: ${blackColour}Linux${endColour} |  {blueColour}Windows${endColour}"
    #echo -e "\t${purpleColour}d${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por la dificultad de una máquina${endColour}: ${greenColour}Easy${endColour} | ${yellowColour}Medium${endColour} | ${redColour}Hard${endColour} | ${purpleColour}Insane${endColour}"
    #echo -e "\t${purpleColour}t${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por técnica.${endColour}"
    #echo -e "\t${purpleColour}T${endColour}${turquoiseColour})${endColour} ${grayColour}Listar todas las técnicas.${endColour}"
    #echo -e "\t${purpleColour}c${endColour}${turquoiseColour})${endColour} ${grayColour}Buscar por certificación.${endColour}"
    #echo -e "\t${purpleColour}y${endColour}${turquoiseColour})${endColour} ${grayColour}Obtener link de la resolución de la máquina en YouTube.${endColour}"
    #echo -e "\t${purpleColour}p${endColour}${turquoiseColour})${endColour} ${grayColour}Listar máquinas por plataforma${endColour}: ${greenColour}HackTheBox${endColour} | ${turquoiseColour}VulnHub${endColour} | ${orangeColour}PortSwigger${endColour}"
    #echo -e "\t${purpleColour}I${endColour}${turquoiseColour})${endColour} ${grayColour}Iniciar modo interactivo.${endColour}"

    echo -e "  ${purpleColour}u${endColour}${turquoiseColour})${endColour} ${grayColour}Descargar o actualizar ficheros necesarios.${endColour}"
    echo -e "  ${purpleColour}h${endColour}${turquoiseColour})${endColour} ${grayColour}Mostrar panel de ayuda.${endColour}"
    echo -e "  ${purpleColour}v${endColour}${turquoiseColour})${endColour} ${grayColour}Versión.${endColour}"

    echo -e "\n${yellowColour}[+]${endColour} Excel: ${blueColour}https://docs.google.com/spreadsheets/d/1dzvaGlT_0xnT-PGO27Z_4prHgA8PHIpErmoWdlUrSoA/edit#gid=0${endColour}"
    echo -e "${yellowColour}[+]${endColour} Web infosecmachines: ${blueColour}https://infosecmachines.io/${endColour}"
    echo -e "\n${yellowColour}[+]${endColour} Github del proyecto: ${blueColour}https://github.com/lukatinarelli/HTBmachines${endColour}"

}


# Descargar o actualizar ficheros
function updateFiles() {
    tput civis
    if [ -f "${ruta}/infosecmachines.json" ]; then
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Comprobando si hay actualizaciones...${endColour}"
        remote_hash=$(curl -sSfL "$main_url" | jq . | md5sum | cut -d' ' -f1) || {
            echo -e "\n${redColour}[!] Error: no se pudo obtener el recurso remoto.${endColour}"
            tput cnorm && return 1
        }
        local_hash=$(md5sum "${ruta}/infosecmachines.json" | cut -d' ' -f1 2>/dev/null || echo "")
        if [ "$remote_hash" != "$local_hash" ]; then
            curl --progress-bar "$main_url" | jq . > "${ruta}/infosecmachines.json"
            echo -e "\n${greenColour}[✓]${endColour}${grayColour} Fichero actualizado.${endColour}\n"
        else
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ya está actualizado.${endColour}\n"
        fi
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Descargando ficheros necesarios...${endColour}\n"
        curl "$main_url" | jq . > "${ruta}/infosecmachines.json"
        echo -e "\n${greenColour}[✓]${endColour}${grayColour} Todos los ficheros se han descargado.${endColour}\n"
    fi

    tput cnorm
}


# Función validar JSON
function validate_json() {
    if [ ! -f "${ruta}/infosecmachines.json" ]; then
        echo -e "\n${redColour}[!]${endColour} ${grayColour}El archivo infosecmachines.json no existe.${endColour}"
        echo -e "${yellowColour}[*]${endColour}${grayColour} Ejecute 'htbmachines.sh -u' para descargarlo.${endColour}\n"
        return 1
    elif ! jq empty "${ruta}/infosecmachines.json" 2>/dev/null; then
        echo -e "\n${redColour}[!]${endColour} ${grayColour}El archivo infosecmachines.json está malformado.${endColour}"
        echo -e "${yellowColour}[*]${endColour} ${grayColour}Puede intentar arreglarlo ejecutando: htbmachines.sh -u${endColour}\n"
        return 1
    fi
}


# Buscar máquina por nombre
function find_machine() {
    local search_name="$1"
    search_name="$(printf '%s' "$search_name" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    local machine_json
    machine_json=$(jq -r --arg nombre "$search_name" '
        .tutorials[]
        | select(
            ((.nombre // "") | gsub("^[\\s]+|[\\s]+$";"") | ascii_downcase)
            ==
            (($nombre // "") | gsub("^[\\s]+|[\\s]+$";"") | ascii_downcase)
        )
    ' "${ruta}/infosecmachines.json")

    if [ -z "$machine_json" ]; then
        # REDIRIGE EL MENSAJE DE ERROR A STDERR
        echo -e "\n${redColour}[!]${endColour} La máquina proporcionada no existe.\n" >&2
        return 1
    fi

    echo "$machine_json"
}


# Extraer campos de la máquina
function extract_fields() { 
    map_output=$(printf '%s' "$machine_json" | jq -r '
    {
        nombre: (if (.nombre//"") != "" then .nombre else "No indicado" end),
        sistemaOperativo: (if (.sistemaOperativo//"") != "" then .sistemaOperativo else "No indicado" end),
        ip: (if (.ip//"") != "" then .ip else "No indicada" end),
        dificultad: (if (.dificultad//"") != "" then .dificultad else "No indicada" end),
        platform: (if (.platform//"") != "" then .platform else "Plataforma no indicada" end),
        videoUrl: (if (.videoUrl//"") != "" then .videoUrl else "No hay vídeo disponible" end),
        tecnicas: (if (try (.tecnicas|length) catch 0) == 0 then "No indicado"
                    elif (try (.tecnicas|type) catch "null") == "array" then (.tecnicas|join("\n"))
                    else (.tecnicas//"No indicada") end),
        certificaciones: (if (try (.certificaciones|length) catch 0) == 0 then "No indicado"
                        elif (try (.certificaciones|type) catch "null") == "array" then (.certificaciones|join("\n"))
                        else (.certificaciones//"No indicada") end)
    }
    | to_entries[]
    | "\(.key)\u001f\(.value|@base64)"
    ')

    while IFS=$'\x1f' read -r key b64; do
    value=$(printf '%s' "$b64" | base64 --decode 2>/dev/null || printf '%s' "$b64" | base64 -d 2>/dev/null)
    case "$key" in
        nombre|sistemaOperativo|ip|dificultad|platform|videoUrl|tecnicas|certificaciones)
        declare -g "$key"="$value"
        ;;
    esac
    done <<< "$map_output"

    return 0
}


# Mostar información de la máquina
function print_machine_info() {
    echo -e "${greenColour}"
    figlet -f slant "$nombre"
    echo -e "${endColour}"

    echo -e "${greenColour}[+]${endColour}${grayColour} Propiedades de la máquina:${endColour}\n"

    # Nombre
    echo -e "${blueColour}Nombre:${endColour} ${grayColour}$nombre${endColour}"

    # OS
    declare -A os_color=( ["Linux"]=$blackColour ["Windows"]=$blueColour )
    echo -ne "${blueColour}OS:${endColour} "
    echo -e "${os_color[$sistemaOperativo]:-${grayColour}}$sistemaOperativo${endColour}"

    # IP
    echo -e "${blueColour}IP:${endColour} ${grayColour}$ip${endColour}"

    # Dificultad
    declare -A dificultad_color=( ["Easy"]=$greenColour ["Medium"]=$yellowColour ["Hard"]=$redColour ["Insane"]=$purpleColour )
    echo -ne "${blueColour}Dificultad:${endColour} "
    echo -e "${dificultad_color[$dificultad]:-${grayColour}}$dificultad${endColour}"

    # Plataforma
    declare -A platform_color=( ["HackTheBox"]=$greenColour ["VulnHub"]=$turquoiseColour ["PortSwigger"]=$orangeColour )
    echo -ne "${blueColour}Plataforma:${endColour} "
    echo -e "${platform_color[$platform]:-${redColour}}$platform${endColour}"

    # Certificaciones
    if [ $(echo "$certificaciones" | grep -cve '^\s*$') -gt 1 ]; then echo -e "${blueColour}Certificaciones:${endColour}"; else echo -e "${blueColour}Certificación:${endColour}"; fi

    while read -r cert; do
        [ -n "$cert" ] && echo -e "  ${purpleColour}-${endColour} $cert"
    done <<< "$certificaciones"

    # Técnicas
    [ $(echo "$tecnicas" | grep -cve '^\s*$') -gt 1 ] && echo -e "${blueColour}Técnicas:${endColour}" || echo -e "${blueColour}Técnica:${endColour}"

    while read -r tech; do
        [ -n "$tech" ] && echo -e "  ${purpleColour}-${endColour} $tech"
    done <<< "$tecnicas"

    # YouTube
    echo -e "${blueColour}YouTube:${endColour} ${redColour}$videoUrl${endColour}"
}


# Función busqueda
function searchMachine() {
    validate_json

    machine_json=$(find_machine "$1") || return

    extract_fields "$machine_json"

    print_machine_info
}

# -----------------------------------------------------------------------------------------------------

#      ________                
#     / ____/ /___ _____ ______
#    / /_  / / __ `/ __ `/ ___/
#   / __/ / / /_/ / /_/ (__  ) 
#  /_/   /_/\__,_/\__, /____/  
#                /____/        

machine_flag=0
update_flag=0
help_flag=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        -m|--machine)
            machine_flag=1
            shift
            if [[ $# -eq 0 || "$1" == -* ]]; then
                echo -e "\n${redColour}[!]${endColour} La opción '-m' requiere un argumento."
                echo -e "${yellowColour}[+] Uso:${endColour} htbmachines.sh -m [nombre_maquina]"
                echo -e "\n${grayColour}Pruebe 'htbmachines.sh -h' para ayuda.${endColour}"
                exit 1
            fi
            machineName="$1"
            shift
            ;;
        -u|--update)
            update_flag=1
            shift
            ;;
        -h|--help)
            help_flag=1
            shift
            ;;
        *)
            echo -e "\n${redColour}[!]${endColour} ${grayColour}Opción desconocida: $1${endColour}"
            echo -e "${yellowColour}[+]${endColour} ${grayColour}Pruebe 'htbmachines.sh -h' para ayuda.${endColour}\n"
            exit 1
            ;;
    esac
done

if [[ $machine_flag -eq 1 ]]; then
    searchMachine "$machineName"
elif [[ $update_flag -eq 1 ]]; then
    updateFiles
elif [[ $help_flag -eq 1 ]]; then
    helpPanel
else
    echo -e "\n${redColour}[!]${endColour} ${grayColour}Modo de empleo: htbmachines.sh [-o sistema] [-d dificultad]...${endColour}"
    echo -e "${yellowColour}[+]${endColour}${grayColour} Pruebe 'htbmachines.sh -h' para ayuda.${endColour}\n"
    exit 1
fi
