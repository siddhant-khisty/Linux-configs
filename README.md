# Arch-Config files
A repo to store all of my Arch configuration files, so I can speed up my customization the next time I decide to do a fresh install of Arch

# List of applications required for all configurations in this repo

# Change the following folders to hidden folders
- config
- themes

# Before running the setup.sh script

Before running the setup script, make sure to download and install yay. In order to do so, enter the following commands
```BASH
$ sudo pacman -S git
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg
```

After doing this, change the setup.sh to a executable by running 
```BASH
$ chmod +x setup.sh
```

Now you can simply run the script using `./setup.sh`. Make sure you are in this directory before executing the script.