<#
script to copy my jupyter lab configuration settings to the respective folder

exprect location of settings as per jupyter lab documentation:
https://jupyterlab.readthedocs.io/en/stable/user/directories.html#jupyterlab-user-settings-directory
#>


$tocopy = "$(Get-Location)"+"\user-settings\*"

# location of the folder were jupyter settings are stored
$lab = $HOME+"\.jupyter\lab"
$settings = $lab+"\user-settings"
# to store a backup of existing settings
$default = $lab+"\default_user-settings"

# check if a path exists
function check { Param ($1) Test-Path -Path $1 -PathType Container }


if (!(check($settings))) {
    # if folder does not exists creat it
    "Creating folder: "+$setting
    New-Item -Path $settings -ItemType Directory | Out-Null
}

if (Test-Path -Path $settings"\*") {
    "Found files in target folder"
    if(!(Test-Path -Path $default)) {
        "Making backup before overwrite"
        New-Item -Path $default -ItemType Directory | Out-Null
        Copy-Item -Path $tocopy -Destination $default -Recurse -Force
    } else {
        "Found existing backup"
    }
}

"Copying settings to target folder"
Copy-Item -Path $tocopy -Destination $settings -Recurse -Force
