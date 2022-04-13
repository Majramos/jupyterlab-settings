# jupyterlab-settings

My jupyter lab user settings and installation scripts for fast deploy

Will copy the settings to the designated [jupter lab directory](https://jupyterlab.readthedocs.io/en/stable/user/directories.html#jupyterlab-user-settings-directory)

If finds any configuration files in the user setting folder, it will make a backup copy and place it in the same folder

Built to be used both in powershell and bash (through wsl or not)

## Installation

```bash
git clone https://github.com/Majramos/jupyterlab-settings

cd jupyterlab-settings
```

Install in windows
```bash
.\install.ps1
```

Install in windows with wsl
```bash
bash ./install.sh
```

Install in linux
```bash
./install.sh
```
