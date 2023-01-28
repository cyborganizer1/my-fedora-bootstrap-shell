https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/index.html



   1. Run the following command to install the mandatory and default packages in the virtualization group:

     sudo dnf install @virtualization

   2. Alternatively, to install the mandatory, default, and optional packages, run:

     sudo dnf group install --with-optional virtualization
     
   3. Install additional virtualization modules.

     sudo dnf install libvirt-devel virt-top libguestfs-tools guestfs-tools

   4. After the packages install, start the libvirtd service:

     sudo systemctl start libvirtd

   5. To start the service on boot, run:

     sudo systemctl enable libvirtd

   6. To verify that the KVM kernel modules are properly loaded:

    $ lsmod | grep kvm
    kvm_amd               114688  0
    kvm                   831488  1 kvm_amd

    If this command lists kvm_intel or kvm_amd, KVM is properly configured.
    
   7. Check that the service is running by executing the command:
     
     sudo systemctl status libvirtd
