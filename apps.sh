
# install gimp
  sudo dnf install -y gimp

# install OpenJDK
# Run the following command to install OpenJDK:
# sudo dnf install <openjdk-package-name>
# sudo dnf install java-1.8.0-openjdk.x86_64

# install jdownloader2
# https://jdownloader.org/download/index

# install vscodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
sudo printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install -y codium

# # install chrome
# sudo dnf install -y fedora-workstation-repositories
# sudo dnf config-manager --set-enabled google-chrome
# sudo dnf install -y google-chrome-stable

# install brave
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser

# # install vivaldi (Crashes when you pull tabs out, use Brave instead)
# sudo dnf install -y dnf-utils
# sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
# sudo dnf install -y vivaldi-stable

# office 365 webapps -install edge 1st
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo mv /etc/yum.repos.d/packages.microsoft.com_yumrepos_edge.repo /etc/yum.repos.d/microsoft-edge-stable.repo
sudo dnf install -y microsoft-edge-stable

# install sysmontask
sudo dnf install -y libwnck3
sudo dnf install -y sysmontask

# install portainer (https://localhost:9443)
# docker volume create portainer_data
# docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# top grade
sudo dnf install rust cargo
cargo install topgrade
echo 'export PATH=$PATH:/home/pala/.cargo/bin' >> /home/pala/.zshrc
cargo install cargo-update

# install terraform
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install -y terraform

# install azure-cli
sudo dnf install -y azure-cli
