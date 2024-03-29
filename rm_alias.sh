#!/bin/sh

remove() {
    match=$(echo "$@" | grep -Eq "^.*-[a-zA-Z]*r.*$" && echo "true" || echo "false")
    if [ "$match" == "true" ]; then
        echo "*** Entered: rmv $@"
        subdirectories=( $(find ${@: -1} -maxdepth 1 -type d) )
        if [ "${#subdirectories[@]}" -le 8 ]; then
                newsubdirectories=( $(find ${@: -1} -maxdepth 2 -mindepth 2 -type d) )
                subdirectories=( "${subdirectories[@]}" "${newsubdirectories[@]}" )
        fi
        echo "*** Subdirectories include:"
        for d in "${subdirectories[@]:0:8}"; do
                echo "    >>> $d"
        done
        if [ "${#subdirectories[@]}" -gt "8" ]; then
                echo "    >>> ..."
        fi
        read -p '*** Are you sure? [Y/n]: ' confirm
        echo ""
        if [ $confirm == 'Y' ]; then
                echo "$@"
                command rm $@
        fi
    else
            echo "no regex $@"
            command rm $@
    fi
}

# place in your .bashrc or .bash_profile file:
#
# alias rmv='remove'
# remover() {
#    echo "Use rmv instead command"
# }
# alias rm='remover'
