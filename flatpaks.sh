# install flatpak repo & flatpaks
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak update

sudo flatpak install -y flathub com.microsoft.Teams
sudo flatpak install -y flathub com.github.eneshecan.WhatsAppForLinux # Issues - Paste clipboard images, laggy/freezes
# sudo flatpak install -y flathub com.sindresorhus.Caprine
sudo flatpak install -y flathub org.onlyoffice.desktopeditors
sudo flatpak install -y flathub com.discordapp.Discord
sudo flatpak install -y flathub me.hyliu.fluentreader

# install freefilesync
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.freefilesync.FreeFileSync
