#!/usr/bin/env bash

# script to copy my jupyter lab configuration settings to the respective folder
#
# expected location of settings as per jupyter lab documentation:
# https://jupyterlab.readthedocs.io/en/stable/user/directories.html#jupyterlab-user-settings-directory

if [[ "$1" == "wsl" ]]; then
    echo "Runing in wsl"
    HOME="/mnt/c/Users/859494"
fi

tocopy="$PWD/user-settings/."

# location of the folder were jupyter settings are stored
lab="$HOME/.jupyter/lab"
settings="$lab/user-settings"
# to store a backup of existing settings
default="$lab/default_user-settings"

echo $tocopy
echo $lab
echo $settings
echo $default


if [ ! -d "$settings" ]; then
    echo "Creating folder: $settings"
    mkdir -p "$settings"
fi


if [ "$(ls -A $settings)" ]; then
    echo "Found files in target folder"
    if [ ! -d "$default" ]; then
        echo "Making backup before overwrite"
        mkdir -p "$default"
        cp -r "$tocopy" "$default"
    else
        echo "Found existing backup"
    fi
fi

echo "Copying settings to target folder"
cp -r "$tocopy" "$settings"
