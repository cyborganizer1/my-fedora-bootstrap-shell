# my-fedora-bootstrap-shell
My own personal modified version of Fedora bootstrap

I tested this guide with Fedora 36. For older versions you can follow this guide.

If you’re upgrading from Fedora 35, please follow this guide.

This guide is an a bit extended version of the official guide available at rpmfusion.

Time needed: 10 minutes.

Here’s how to automatically sign NVidia kernel module in Fedora 36

    Install the tools required for auto signing to work

    sudo dnf install kmodtool akmods mokutil openssl
    Generate a signing key

    sudo kmodgenca -a
    Initiate the key enrollment

    This will make Linux kernel trust drivers signed with your key
    sudo mokutil --import /etc/pki/akmods/certs/public_key.der
    You will be asked to enter a password, it doesn’t have to be very strong, just make sure to remember it. You’ll only need it once during step 5.
    Reboot to enroll the key

    sudo reboot
    Enroll the key

    After reboot you will see MOK Manager interface and will be asked to enroll the key. Probably if you ever installed nVidia drivers in Ubuntu with Secure boot enabled, you’ve seen this interface before.
    First select “Enroll MOK“.
    Then “Continue“.
    Hit “Yes” and enter the password from step 3.
    Then select “OK” and your device will reboot again.
    Install NVidia driver

    Now just install NVidia driver like you would typically do.
    sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
    Make sure the kernel modules got compiled

    sudo akmods --force
    Make sure the boot image got updated as well

    sudo dracut --force
    Reboot your device

    sudo reboot

Now that you’re done, make sure to verify the driver got loaded after reboot:

$> lsmod | grep -i nvidia

nvidia_drm             73728  1
nvidia_modeset       1150976  2 nvidia_drm
nvidia              36954112  129 nvidia_modeset
drm_kms_helper        311296  2 nvidia_drm,i915
drm                   630784  28 drm_kms_helper,nvidia,nvidia_drm,i915,ttm
Code language: Gradle (gradle)

if you have output similar to the one above, then everything went smoothly and you’re all set!
