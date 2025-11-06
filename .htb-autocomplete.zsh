# .htb-autocomplete.zsh
_autocomplete_htbmachines() {
    local -a servicios opts
    local cur prev

    cur="${words[CURRENT]}"
    prev="${words[CURRENT-1]}"

    # Obtener nombres de máquinas del JSON
    servicios=($(jq -r '.newData[] | .name' infosecmachines.json | sort -u | grep -i "$cur"))

    # Opciones generales
    opts=(
    --all                      -a  -- Listar todas las máquinas
    --machines                 -A  -- Listar todas las máquinas
    --ip                       -i  -- ...
    --list                     -l  -- ...
    --os                       -o  -- ...
    --dificulty                -d  -- ...
    --difficulty               -d  -- ...
    --Techs                    -T  -- ...
    --certs                    -c  -- ...
    --youtube                  -y  -- ...
    --platform                 -p  -- ...
    --interactive              -i  -- ...
    --update                   -u  -- ...
    --version                  -v  -- ...
    )


    if [[ "$prev" == "-m" ]]; then
        compadd "${servicios[@]}"
    else
        compadd "Completing option"
        compadd "${opts[@]}"
    fi
}

# Asignar función de autocompletado a tu script
compdef _autocomplete_htbmachines htbmachines.sh
