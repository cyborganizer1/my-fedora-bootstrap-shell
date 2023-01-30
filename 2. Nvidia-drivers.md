Automatically sign NVidia Kernel module in Fedora 36

https://blog.monosoul.dev/2022/05/17/automatically-sign-nvidia-kernel-module-in-fedora-36/


Here’s how to automatically sign NVidia kernel module in Fedora 36

    1. Install the tools required for auto signing to work
    sudo dnf install kmodtool akmods mokutil openssl
    
    2. Generate a signing key
    sudo kmodgenca -a
    
    3. Initiate the key enrollment
    This will make Linux kernel trust drivers signed with your key
    sudo mokutil --import /etc/pki/akmods/certs/public_key.der
    You will be asked to enter a password, it doesn’t have to be very strong, just make sure to remember it. You’ll only need it once during step 5.
    
    4. Reboot to enroll the key
    sudo reboot
    
    5. Enroll the key
    After reboot you will see MOK Manager interface and will be asked to enroll the key. Probably if you ever installed nVidia drivers in Ubuntu with Secure boot enabled, you’ve seen this interface before.
    First select “Enroll MOK“.
    Then “Continue“.
    Hit “Yes” and enter the password from step 3.
    Then select “OK” and your device will reboot again.
    
    6. Install NVidia driver
    Now just install NVidia driver like you would typically do.
    sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
    
    7. Make sure the kernel modules got compiled
    sudo akmods --force
    
    8. Make sure the boot image got updated as well
    sudo dracut --force
    
    9. Reboot your device
    sudo reboot

Now that you’re done, make sure to verify the driver got loaded after reboot:

    $> lsmod | grep -i nvidia

    nvidia_drm             73728  1
    nvidia_modeset       1150976  2 nvidia_drm
    nvidia              36954112  129 nvidia_modeset
    drm_kms_helper        311296  2 nvidia_drm,i915
    drm                   630784  28 drm_kms_helper,nvidia,nvidia_drm,i915,ttm

if you have output similar to the one above, then everything went smoothly and you’re all set!

To check which drivers are installed for the kernel you are using
    
    lspci -k | grep -A 2 VGA 
    
    NVIDIA

    pcilib: Error reading /sys/bus/pci/devices/0000:00:08.3/label: Operation not permitted
    01:00.0 VGA compatible controller: NVIDIA Corporation GA107BM [GeForce RTX 3050 Mobile] (rev a1)
            Subsystem: Lenovo Device 3b12
            Kernel driver in use: nvidia
    --
    04:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt [Radeon 680M] (rev 02)
            Subsystem: Lenovo Device 3b1e
            Kernel driver in use: amdgpu


Issues
https://ask.fedoraproject.org/t/nvidia-drivers-not-working-anymore-after-kernel-6-0-x-update/27987/13


