
https://centosfaq.org/centos/qemu-enabling-bridge-mode-for-primary-physical-interface-for-vms/#comment-133554

https://www.reddit.com/r/Fedora/comments/twg4fn/question_about_bridged_network_for_qemukvm/

https://discussion.fedoraproject.org/t/virtual-machine-manager-bridged-network-why-so-complicated-to-achiev/38979

https://computingforgeeks.com/how-to-create-and-configure-bridge-networking-for-kvm-in-linux/


Fedora uses NetworkManager by default, so those files won't be used. Instead:

# Create a bridge interface

nmcli con add type bridge ifname br0 bridge.stp no

# Copy all the IPv4/IPv6 config from an existing interface

nmcli con mod bridge-br0 $(nmcli -f ipv4.method,ipv4.addresses,ipv4.gateway,ipv6.method,ipv6.addresses,ipv6.gateway con show em1 | grep -v -- -- | sed 's/: */ /')

# -or- just set an IPv4 address/gateway to known values

nmcli con mod bridge-br0 ipv4.method manual ipv4.address 10.1.1.2/24 ipv4.gateway 10.1.1.1 ipv6.method ignore

# Make a connection for the physical ethernet em1 to be part of the bridge

nmcli con add type ethernet ifname em1 master bridge-br0

# Switch from the "regular" em1 to the bridge

nmcli con down em1; nmcli con up bridge-br0; nmcli con up bridge-slave-em1

# Disable the original config

nmcli con mod em1 autoconnect 0
