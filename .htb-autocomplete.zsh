# .htb-autocomplete.zsh
#compdef htbmachines.sh

_autocomplete_htbmachines() {
    local -a servicios opt_words opt_desc
    local cur prev

    cur="${words[CURRENT]}"
    prev="${words[CURRENT-1]}"

    if (( ! ${+htb_machines_cache} )); then
        if [[ -r infosecmachines.json ]]; then
            htb_machines_cache=("${(@f)$(jq -r '.tutorials[] | .name' infosecmachines.json 2>/dev/null | sort -u)}")
        else
            htb_machines_cache=()
        fi
    fi
    servicios=("${htb_machines_cache[@]}")

    local -a opts=(
        "--all -a Mostrar todas las máquinas"
        "--machines -m Buscar una máquina por nombre"
        "--ip -i Buscar una máquina por dirección IP"
        "--os -o Filtrar máquinas por sistema operativo"
        "--difficulty -d Filtrar máquinas por dificultad"
        "--interactive -I Modo interactivo"
        "--update -u Actualizar la base de datos"
        "--version -v Mostrar la versión"
        "--platform -p Filtrar por plataforma"
    )

    if [[ "$prev" == "-o" || "$prev" == "--os" ]]; then
        local -a os_vals=("Windows" "Windows" "Linux" "Linux")
        os_vals=("${(@u)os_vals}")
        compadd -- $os_vals
        return
    fi

    # autocompletado dificultad español

    # autocompletado dificultad ingres

    
    if [[ "$prev" == "-p" || "$prev" == "--platform" ]]; then
        local -a plat_vals=("PortSwigger" "VulnHub" "HackTheBox")
        plat_vals=("${(@u)plat_vals}")
        compadd -- $plat_vals
        return
    fi

    if [[ "$prev" == "-m" || "$prev" == "--machines" ]]; then
        compadd -- $servicios
        return
    fi

    if [[ "$cur" == -* ]]; then
        opt_words=()
        opt_desc=()
        local long short desc
        local max_long=0 max_short=0

        for entry in "${opts[@]}"; do
            long=${entry[(w)1]}
            short=${entry[(w)2]}
            (( ${#long} > max_long )) && max_long=${#long}
            (( ${#short} > max_short )) && max_short=${#short}
        done

        for entry in "${opts[@]}"; do
            long=${entry[(w)1]}
            short=${entry[(w)2]}
            desc=${entry[(w)3,-1]}

            opt_desc+=("${(r:max_long:)long}  ${(r:max_short:)short}  -- $desc")

            if [[ "$cur" == --* ]]; then
                opt_words+=("$long")
            else
                opt_words+=("$short")
            fi
        done

        compadd -X "Completing option" -d opt_desc -- $opt_words
        return
    fi
}

# Registrar autocompletado
compdef _autocomplete_htbmachines htbmachines.sh
