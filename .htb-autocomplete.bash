_htb_autocomplete() {
    local cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Cache una vez
    if [[ -z "${HTB_MACHINES_CACHE+x}" ]]; then
        if [[ -r infosecmachines.json ]]; then
            mapfile -t HTB_MACHINES_CACHE < <(jq -r '.tutorials[] | .name' infosecmachines.json | sort -u)
        else
            HTB_MACHINES_CACHE=()
        fi
    fi

    # Flags largas (como grep)
    local opts="
        --all
        --machines
        --ip
        --os
        --difficulty
        --interactive
        --update
        --version
        --platform
    "

    # Valores según flag previa
    case "$prev" in
        -m|--machines)
            COMPREPLY=( $(compgen -W "${HTB_MACHINES_CACHE[*]}" -- "$cur") )
            return ;;
        -o|--os)
            COMPREPLY=( $(compgen -W "Windows Linux" -- "$cur") )
            return ;;
        -p|--platform)
            COMPREPLY=( $(compgen -W "HackTheBox VulnHub PortSwigger" -- "$cur") )
            return ;;
        -d|--difficulty)
            COMPREPLY=( $(compgen -W "Easy Medium Hard Insane Fácil Media Difícil Extrema" -- "$cur") )
            return ;;
    esac

    # Si empieza con "-", solo sugerir flags largas
    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi

    # Sin fallback — no sugerir máquinas por defecto
    COMPREPLY=()
}

complete -F _htb_autocomplete htbmachines.sh
