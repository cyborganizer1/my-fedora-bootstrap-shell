#!/bin/env bash

# To run do:
# curl -L https://raw.githubusercontent.com/cyborganizer1/my-fedora-bootstrap-shell/main/bootstrap.sh | bash
# OR
# curl -L https://tinyurl.com/nhkhfd54 | bash

# Convert Windows-style line endings to Unix-style (and vice versa)
    #sed -i 's/\r$//' ./bootstrap.sh

# increase dnf speed
sudo bash -c "cat >> /etc/dnf/dnf.conf << "EOF"
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOF"

# clear dnf cache
sudo dnf clean dbcache
sudo dnf clean all

# base_packages
sudo dnf update -y
sudo dnf install -y "@core"
sudo dnf install -y "@fonts"
sudo dnf install -y "@hardware-support"
sudo dnf install -y "@networkmanager-submodules"
sudo dnf install -y "@printing"
sudo dnf install -y "@x86-baremetal-tools"
sudo dnf install -y ModemManager
sudo dnf install -y NetworkManager-adsl
sudo dnf install -y NetworkManager-config-connectivity-fedora
sudo dnf install -y NetworkManager-ppp
sudo dnf install -y NetworkManager-team
sudo dnf install -y NetworkManager-tui
sudo dnf install -y NetworkManager-wifi
sudo dnf install -y adwaita-gtk2-theme
sudo dnf install -y adwaita-qt5
sudo dnf install -y alsa-firmware
sudo dnf install -y alsa-plugins-pulseaudio
sudo dnf install -y alsa-ucm
sudo dnf install -y alsa-utils
sudo dnf install -y bash-completion
sudo dnf install -y cryptsetup
sudo dnf install -y earlyoom
sudo dnf install -y glibc-all-langpacks
sudo dnf install -y irqbalance
sudo dnf install -y kernel-headers
sudo dnf install -y libsane-hpaio
sudo dnf install -y nm-connection-editor
sudo dnf install -y openssh-askpass
sudo dnf install -y pulseaudio-utils
sudo dnf install -y pipewire-utils
sudo dnf install -y rp-pppoe
sudo dnf install -y usb_modeswitch
sudo dnf install -y python3-dnf-plugins-extras-common
sudo dnf install -y python3-dnf-plugin-system-upgrade
sudo dnf install -y wget

# xorg_packages
sudo dnf install -y "@base-x"
sudo dnf install -y "@firefox"
sudo dnf install -y xgamma
sudo dnf install -y xmodmap
sudo dnf install -y xprop
sudo dnf install -y xrdb
sudo dnf install -y zram
sudo dnf install -y libappindicator

# kde_packages
sudo dnf install -y bluedevil
sudo dnf install -y breeze-gtk
sudo dnf install -y breeze-icon-theme
sudo dnf install -y colord-kde
sudo dnf install -y cups-pk-helper
sudo dnf install -y glibc-all-langpacks
sudo dnf install -y kaccounts-integration
sudo dnf install -y kaccounts-providers
sudo dnf install -y kcm_systemd
sudo dnf install -y kde-gtk-config
sudo dnf install -y kde-partitionmanager
sudo dnf install -y kde-print-manager
sudo dnf install -y kde-settings-pulseaudio
sudo dnf install -y kde-style-breeze
sudo dnf install -y kdeplasma-addons
sudo dnf install -y kdialog
sudo dnf install -y kdnssd
sudo dnf install -y kfind
sudo dnf install -y kgpg
sudo dnf install -y khotkeys
sudo dnf install -y kio-extras
sudo dnf install -y kio-ftps
sudo dnf install -y kio-fuse
sudo dnf install -y kio-gdrive
sudo dnf install -y kio-upnp-ms
sudo dnf install -y kmenuedit
sudo dnf install -y kscreen
sudo dnf install -y kscreenlocker
sudo dnf install -y ksysguard
sudo dnf install -y kwebkitpart
sudo dnf install -y kwin
sudo dnf install -y pam-kwallet
sudo dnf install -y phonon-qt5-backend-gstreamer
sudo dnf install -y plasma-breeze
sudo dnf install -y plasma-desktop
sudo dnf install -y plasma-nm
sudo dnf install -y plasma-nm-fortisslvpn
sudo dnf install -y plasma-nm-iodine
sudo dnf install -y plasma-nm-l2tp
sudo dnf install -y plasma-nm-mobile
sudo dnf install -y plasma-nm-openconnect
sudo dnf install -y plasma-nm-openswan
sudo dnf install -y plasma-nm-openvpn
sudo dnf install -y plasma-nm-pptp
sudo dnf install -y plasma-nm-ssh
sudo dnf install -y plasma-nm-sstp
sudo dnf install -y plasma-nm-strongswan
sudo dnf install -y plasma-nm-vpnc
sudo dnf install -y plasma-pa
sudo dnf install -y plasma-user-manager
sudo dnf install -y plasma-workspace
sudo dnf install -y plasma-workspace-geolocation
sudo dnf install -y polkit-kde
sudo dnf install -y qt5-qtbase-gui
sudo dnf install -y qt5-qtdeclarative
sudo dnf install -y sddm
sudo dnf install -y sddm-breeze
sudo dnf install -y sddm-kcm
sudo dnf install -y setroubleshoot
sudo dnf install -y sni-qt
sudo dnf install -y spectacle
sudo dnf install -y system-config-language

# applications
sudo dnf install -y ark
sudo dnf install -y dolphin
sudo dnf install -y gwenview
sudo dnf install -y kate
sudo dnf install -y konsole5
sudo dnf install -y okular

# dev_tools
sudo dnf install -y tree
sudo dnf install -y bat # cat clone with syntax highlighting and Git integration
# sudo dnf install -y dos2unix (not sure if this required)
sudo dnf install -y git
sudo dnf install -y hstr # bash and zsh shell history suggest box (https://github.com/dvorka/hstr)

# install powershell
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
$ sudo dnf makecache
$ sudo dnf install -y powershell

# improve multimedia compatibility via rpmfusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate -y core
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video
sudo dnf install -y libva libva-utils mesa-vulkan-drivers
sudo dnf install -y vlc vlc-extras mpv
sudo dnf install -y vlc

# nvidia graphic cards - https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla
# Secure Boot must be disabled, then you can renable afterwards
sudo dnf update --refresh
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda

# intel graphic cards (using AMD/NVIDIA drivers now)
# sudo dnf install -y libva-intel-driver intel-media-driver

# install tilling manager bismuth
# sudo dnf -y copr enable capucho/bismuth
# sudo dnf install -y bismuth

# Change Hostname
sudo hostnamectl set-hostname "fedora-lap"

# install zsh, make it the default shell
sudo dnf install -y zsh
sudo dnf install -y util-linux-user
chsh -s $(which zsh)

# install oh-my-zsh (do not install as Sudo or $HOME will point to /root)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# set .zshrc
sudo wget -O $HOME/.zshrc https://raw.githubusercontent.com/cyborganizer1/my-dotfiles/main/.zshrc--no-check-certificate

# set .zsh_aliases (do not install as Sudo or $HOME will point to /root)
wget -O $HOME/.zsh_aliases https://raw.githubusercontent.com/cyborganizer1/my-dotfiles/main/.zsh_aliases --no-check-certificate

# install oh-my-zsh plugins (do not install as Sudo or $HOME will point to /root)
git clone https://github.com/djui/alias-tips.git $HOME/.oh-my-zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# install powerlevel10k (do not install as Sudo or $HOME will point to /root)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# set .p10k.zsh (do not install as Sudo or $HOME will point to /root)
wget -O $HOME/.p10k.zsh https://raw.githubusercontent.com/cyborganizer1/my-dotfiles/main/.p10k.zsh --no-check-certificate

# install docker/compose
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker

# configure docker to run without root privileges
sudo groupadd docker
sudo usermod -aG docker $USER

# configure docker to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Change Docker root directory /var/lib/docker to another location (make if/else statement)
    # create a separate partition for docker
    # then
    # move all docker files to new partition and start docker service
    # https://linuxconfig.org/how-to-move-docker-s-default-var-lib-docker-to-another-directory-on-ubuntu-debian-linux
    # https://www.digitalocean.com/community/questions/how-to-move-the-default-var-lib-docker-to-another-directory-for-docker-on-linux

##Plasma-Discover (buggy, don't install)
#dnf install -y plasma-pk-updates
#dnf install -y plasma-discover

# Setup the graphical interface for login and DE
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# arc KDE theme
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install.sh | sh

# Update repos & system then reboot
sudo dnf update --refresh
sudo dnf update -y
echo "Rebooting..."
sudo reboot now


# (Might not be required)
# #VSCode - Install Fonts
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# rm -rf fonts

# # install fontawesome
# dnf install -y fontawesome-fonts-web
