#!/usr/bin/env bash

# 
# Recurse through specified folder to find all '.systemextension'
# folders and check whether the system extension is enabled via systemextensionctl
# 
# $1 - Folder to recurse through, default $PWD
# 
# Examples:
# ./script.sh
# ./script.sh /Applications
# 
recurse() {
    # Use provided folder to recurse, if not specified use current dir
    curdir=$(pwd)
    if [[ -n $1 ]]; then
        curdir=$1
    fi

    # Get the list of enabled system extension
    enabled_sysext=$(systemextensionsctl list | grep 'activated enabled' | awk '{print $4}')

    # Looping through all directory with '.systemextension' in it
    OLD_IFS=$IFS
    IFS=$'\n'
    for dir in $(find $curdir -type d -name '*.systemextension'); do
        # Getting the app name and system extension name
        app_name=$(echo $dir | sed -E 's/.*\/([^/]+)\.app.*/\1/g')
        sysext_name=$(echo $dir | sed -E 's/.*\/([^/]+)\.systemextension$/\1/g')

        # Check whether the app system extension is loaded
        echo $enabled_sysext | grep $sysext_name 2>&1 >/dev/null
        if [[ $? == 0 ]]; then
            echo "$app_name | $sysext_name (loaded)"
        else
            echo "$app_name | $sysext_name (not loaded)"
        fi
    done
    IFS=$OLD_IFS

    exit 0
}

recurse "$@"
