# install flatpak repo & flatpaks
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak update

sudo flatpak install -y flathub com.microsoft.Teams
sudo flatpak install -y flathub com.github.eneshecan.WhatsAppForLinux
sudo flatpak install -y flathub com.sindresorhus.Caprine