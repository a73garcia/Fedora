#!/bin/bash

echo -e "\033[33m
Configuración inicial del terminal e instalación de paquetes basicos en SO basados en \033[1m\033[4m\033[32mArch\033[0m

\033[0m"

#Eliminacion de configuraciones previas
#Activar solo si es necesario
# sudo rm -r /root/.oh-my-zsh /root/.zshrc ~/.local/share/fonts/meslolg /root/.fzf /root/.fzf.zsh /root/.fzf.bash /root/.shell.pre-oh-my-zsh /home/gh0stwalk3r/.oh-my-zsh

# Actualizar paquetes y refrescar metadatos
echo -e "\033[31mActualizando sistema...\033[0m"

sudo pacman -Syuu


echo -e "\033[31mActualizando los repositorios...\033[0m"
sudo pacman -Syuu

# Instalar paquetes necesarios
echo -e "\033[31mInstalando paquetes...\033[0m"
sudo pacman -S git ksshaskpass wget kate feh p7zip locate lsd bat net-tools neovim gparted curl fastfetch kitty dolphin gimp inkscape hexchat qbittorrent putty thunderbird keepass keepassxc texlive texmaker powerline-fonts gnome-boxes zsh vscode

yay -S plex-media-server

cd /tmp/
git clone https://aur.archlinux.org/mediawriter.git
cd mediawriter/
makepkg -si
#cd ..
#git clone https://aur.archlinux.org/balena-etcher.git 
#cd balena-etcher/
#makepkg -si
cd


# Instalar ZSH y Clonar el tema powerlevel10k
echo -e "\033[31mInstalando Oh My Zsh...\033[0m"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cambiar el shell a Zsh
echo -e "\033[31mCambiando el shell a Zsh...\033[0m"
chsh -s $(which zsh)

echo -e "\033[31mClonando Powerlevel10k...\033[0m"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Añadir plugins de Zsh
echo -e "\033[31mAñadiendo plugins para ZSH: Syntax Highlighting, Autosuggestions, zsh-z, Fast Syntax Highlighting, Autocomplete, fzf...\033[0m"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Descargar y configurar las fuentes Meslo
echo -e "\033[31mDescargando y configurando las fuentes Meslo...\033[0m"
cd /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
mkdir -p ~/.local/share/fonts/meslolg
unzip Meslo.zip -d ~/.local/share/fonts/meslolg
fc-cache -v
cd ${ZSH_CUSTOM:-$HOME/}

# Copiar la configuración personalizada de zshrc y p10k del repositorio
echo -e "\033[31mCopiando configuraciones personalizadas zshrc y p10k del repositorio...\033[0m"
curl -o /home/$USER/.zshrc https://raw.githubusercontent.com/a73garcia/Fedora/refs/heads/main/Config/zshrc
curl -o /home/$USER/.p10k.zsh https://raw.githubusercontent.com/a73garcia/Fedora/refs/heads/main/Config/p10k.zsh

#---------------------------------

# Instalamos ZSH en Root
echo -e "\033[31mInstalamos ZSH en Root...\033[0m"

# Ir al directorio raiz usuario
echo -e "\033[31mIr al directorio raiz usuario...\033[0m"
sudo cd /root/

# Instalar ZSH y Clonar el tema powerlevel10k
echo -e "\033[31mInstalando Oh My Zsh...\033[0m"
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\033[31mClonando Powerlevel10k...\033[0m"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Añadir plugins de Zsh
echo -e "\033[31mAñadiendo plugins para ZSH: Syntax Highlighting, Autosuggestions, zsh-z, Fast Syntax Highlighting, Autocomplete, fzf...\033[0m"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo git clone https://github.com/agkozak/zsh-z /root/.oh-my-zsh/custom/plugins/zsh-z
sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
sudo git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git /root/.oh-my-zsh/custom/plugins/zsh-autocomplete
sudo git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
sudo /root/.fzf/install

# Copiar la configuración personalizada de zshrc y p10k
echo -e "\033[31mCopiando configuraciones personalizadas zshrc y p10k...\033[0m"
curl -o /root/.zshrc https://raw.githubusercontent.com/a73garcia/Fedora/refs/heads/main/Config/zshrc
curl -o /root/.p10k.zsh https://raw.githubusercontent.com/a73garcia/Fedora/refs/heads/main/Config/p10k.zsh

sudo rm -r /home/$USER/.zshrc.pre* /root/.zshrc.pre* /home/$USER/.z /root/.z

# Iniciar el servicio de Plex
#echo "\033[31mIniciando Plex Media Server y habilitando dn el arranque...\033[0m"
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service

# Comprobar el estado del servicio
echo -e "\033[31mComprobando el estado de Plex Media Server...\03q3[0m"
sudo systemctl status plexmediaserver.service

clear

echo -e "

\033[1m\033[4m\033[33mInstalacion finalizada correctamente\033[0m

\033[1m\033[32mResumen de la instalacion:\033[0m

- Se ha actualizado SO
- Se han instalado los siguientes paquetes:\033[1m\033[33m

            git             net-tools           inkscape            texmaker
            wget            neovim              hexchat             powerline-fonts
            kate            gparted             qbittorrent         gnome-boxes
            feh             curl                putty               vscode
            p7zip           fastfetch           thunderbird         plex-media-server
            locate          kitty               keepass             zsh
            lsd             dolphin             keepassxc           MediaWriter
            bat             gimp                texlive\033[0m

- Se ha verificado actualizaciones
- Se ha cambiado la Shell a ZSH para el Usuario y Root
- Se ha añadido Powerlevel10k y añadido los plugins para ZSH en Usuario y Root\033[1m\033[33m

            Syntax Highlighting
            Autosuggestions
            zsh-z
            Fast Syntax Highlighting
            Autocomplete
            fzf\033[0m

- Se ha descargado y configurando las fuentes Meslo
- Se han copiando configuraciones personalizadas zshrc y p10k
- Se levanta el servicio PlexServer

        URL: \033[1m\033[33mhttp://localhost:32400/web\033[0m

"
