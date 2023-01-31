
https://centosfaq.org/centos/qemu-enabling-bridge-mode-for-primary-physical-interface-for-vms/#comment-133554

https://www.reddit.com/r/Fedora/comments/twg4fn/question_about_bridged_network_for_qemukvm/


Fedora uses NetworkManager by default, so those files won't be used. Instead:

If you are running NetworkManager (the default), it’s not too hard. Here’s an example step-by-step for changing an existing interface “em1” to be a bridge “br0”:

THIS WILL MAKE IT LOOK LIKE YOU HAVE NO ETHERNET CONNECTION IN CONNECTION MANAGER - BUT YOU HAVE

# Create a bridge interface 
    nmcli con add type bridge ifname br0 bridge.stp no

# Copy all the IPv4/IPv6 config from an existing interface
    nmcli con mod bridge-br0 $(nmcli -f ipv4.method,ipv4.addresses,ipv4.gateway,ipv6.method,ipv6.addresses,ipv6.gateway con show eth0 | grep -v — — | sed ‘s/: */ /’)

# -or- just set an IPv4 address/gateway to known values 
    nmcli con mod bridge-br0 ipv4.method manual ipv4.address 192.168.0.189/24 ipv4.gateway 192.168.0.1 ipv4.dns 192.168.1.1 ipv6.method ignore

# Make a connection for the physical ethernet em1 to be part of the bridge 
    nmcli con add type ethernet ifname eth0 master bridge-br0

# Switch from the “regular” em1 to the bridge nmcli con down em1; 
    nmcli con up bridge-br0; nmcli con up bridge-slave-eth0

# Disable the original config 
    nmcli con mod eth0 autoconnect 0

