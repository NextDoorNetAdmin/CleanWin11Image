# CleanWin11Image

Windows 11 comes with a lot of "pack-in" apps from Microsoft. It also comes with Microsoft allowed to push their desired "suggested" or promoted apps into your brand-new Windows install.

But Microsoft also has a lot of free tools available for us to customize the install for Windows 11--if you know where to find them and how to use them.

I did a series on YouTube called "Window Cleaning," where I walked viewers through the various ways that we can customize the Windows 11 installation image, create unattend.xml files, and additionally customize an image using Audit mode. This repo holds the various files I used in the final start-to-finish video, containing all the commands and tweaks I would normally employ.

Steps to recreate the result:

1. Download the [Windows 11 ISO](https://www.microsoft.com/en-us/software-download/windows11) (current version is 24H2).
2. Extract the install.wim file.
   - Also extract your desired installation for simplicity! I use Windows 11 Pro.
3. Mount the install.wim.
4. Use Deprovision.ps1 to remove the AppX packages you want to remove.
   - Run as Administrator!
5. Use InsertReg.cmd to insert the registry values you want to use.
   - Run as Administrator!
6. Unmount (and re-export) the install.wim.
7. Replace the install.wim on your installation media.
8. Use the Autounattend.xml to install the image to Audit mode.
9. Customize your installation with additional apps and settings.
10. Export your default app settings!
11. Prepare your unsealing scripts.
    - kicker.cmd for anything that should fire in SYSTEM context
    - deploy.cmd for anything that should fire in user context
12. Sysprep the image using Seal.cmd.
13. Boot into Windows PE and re-apply your default app settings.
    - Also make sure you have a copy of Winre.wim located in S:\Windows\System32\Recovery\
14. Capture the sealed image.
15. Use the commands within DeployImage.cmd to partition your target machine, deploy the image, adjust the unattend.xml, and create the boot files.
16. Boot into a clean Windows 11 install!

## Credits

Deprovisioning and registry insertions thanks to [https://github.com/ntdevlabs/tiny11builder](https://github.com/ntdevlabs/tiny11builder)

Inspiration for some of the unattend.xml entries are thanks to [https://github.com/pbatard/rufus](https://github.com/pbatard/rufus)
