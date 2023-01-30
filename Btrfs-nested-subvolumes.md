# brtfs subvolume list
    sudo btrfs subvolume list /

# Nested Subvolume /var/log
    sudo mv -v /var/log /var/log-old
    sudo btrfs subvolume create /var/log
    sudo cp -arv /var/log-old/. /var/log/
    sudo restorecon -RFv /var/log
    sudo rm -rvf /var/log-old

# Nested Subvolume /var/tmp
    sudo mv -v /var/tmp /var/tmp-old
    sudo btrfs subvolume create /var/tmp
    sudo cp -arv /var/tmp-old/. /var/tmp/
    sudo restorecon -RFv /var/tmp
    sudo rm -rvf /var/tmp-old

# Nested Subvolume /var/cache
    sudo mv -v /var/cache /var/cache-old
    sudo btrfs subvolume create /var/cache
    sudo cp -arv /var/cache-old/. /var/cache/
    sudo restorecon -RFv /var/cache
    sudo rm -rvf /var/cache-old

# Nested Subvolume /var/lib/docker
    sudo mv -v /var/lib/docker /var/lib/docker-old
    sudo btrfs subvolume create /var/lib/docker
    sudo cp -arv /var/lib/docker-old/. /var/lib/docker/
    sudo restorecon -RFv /var/lib/docker
    sudo rm -rvf /var/lib/docker-old

# Nested Subvolume ~/Downloads
    mv ~/Downloads ~/Downloads-old
    btrfs subvolume create ~/Downloads
    mv ~/Downloads-old/* ~/Downloads
    rm -r ~/Downloads-old/

# Nested Subvolume ~/.cache
    mv ~/.cache ~/.cache-old
    btrfs subvolume create ~/.cache
    rm -r ~/.cache-old/

# Nested Subvolume ~/.local/share/Steam
    btrfs subvolume create ~/.local/share/Steam

# Nested Subvolume /var/lib/flatpak
    sudo btrfs subvolume create /var/lib/flatpak

# Nested Subvolume /var/lib/libvirt/
    sudo mkdir /var/lib/libvirt/
    sudo btrfs subvolume create /var/lib/libvirt/images