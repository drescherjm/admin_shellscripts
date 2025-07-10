# Bash completion for zfs_snapshot_holds.sh
_zfs_snapshot_holds_completion()
{
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    # Only try to complete the first argument
    if [[ $COMP_CWORD -eq 1 ]]; then
        # Get the list of available ZFS datasets
        local datasets
        datasets=$(zfs list -H -o name 2>/dev/null)
        COMPREPLY=( $(compgen -W "${datasets}" -- "$cur") )
    fi

    return 0
}

# Register the completion function for your script
complete -F _zfs_snapshot_holds_completion zfs_snapshot_holds.sh

