# nvim
vim config for dayly usage

## Docker

⚠️  no obsidian integration

pwhs example
```powershell
docker volume create nvim-data
docker volume create nvim-cache
docker run -it --rm `
   --name neovim `
   --hostname neovim `
   -w /root `
   -v ${HOME}/nvim:'/root/.config/nvim' `
   -v ${HOME}/obsidian:'/root/obsidian' `
   -v nvim-data:/root/.local/ `
   -v nvim-cache:/root/.cache/ `
   $(docker  build -q .)
```

## windows

choco example

```powershell
choco install ripgrep fd gzip unzip 7zip `
  lua luarocks julia strawberryperl diffutils strawberryperla -y
choco install python310 --version 3.10.11 --params "/InstallDir:C:\Python310" -y
#global python modules OR USE GLOBAL-NVIM  Python&VENV
# `let g:python3_host_prog = '\Python310\bin\python.exe'`
\Python310\bin\python.exe -m pip install pynvim
\Python310\bin\python.exe -m pip install pipenv
\Python310\bin\python.exe -m pip install debugpy #optional
```

## Linux

global packages:
* Python
* lua
* luarock
* git
* ripgrep
* fd

### Custom venv for nvim (best way)
create Python venv and pass venv python path:

`let g:python3_host_prog = '~/.local/nvim-env/python3'`

install modules to venv : pynvim pipenv debugpy

### global pip packages

install packages with your package manager

`sudo packman -S python-nvim python-pipenv python-debugpy`
