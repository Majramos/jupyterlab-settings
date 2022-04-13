#!/usr/bin/env bash

# script to copy my jupyter lab configuration settings to the respective folder
#
# expected location of settings as per jupyter lab documentation:
# https://jupyterlab.readthedocs.io/en/stable/user/directories.html#jupyterlab-user-settings-directory

if [[ "$(</proc/sys/kernel/osrelease)" == *microsoft* ]]; then
    echo "Runing in wsl"
    HOME="/mnt/c/Users/859494"
fi


tocopy="$PWD/user-settings/."

# location of the folder were jupyter settings are stored
lab="$HOME/.jupyter/lab"
settings="$lab/user-settings"
# to store a backup of existing settings
default="$lab/default_user-settings"


if [ ! -d "$settings" ]; then
    # if folder does not exists create it
    echo "Creating folder: $settings"
    mkdir "$settings"
fi


if [ "$(ls -A $settings)" ]; then
    echo "Found files in target folder"
    if [ ! -d "$default" ]; then
        echo "Making backup before overwrite"
        mkdir "$default"
        cp -r "$tocopy" "$default"
    else
        echo "Found existing backup"
    fi
fi

echo "Copying settings to target folder"
cp -r "$tocopy" "$settings"
