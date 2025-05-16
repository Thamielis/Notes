---
created: 2022-03-04T12:23:49 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iii-building-a-single-binaries-iso/
author: Published by feardamhan
---

# Part 03 Building a Single Binaries ISO

> ## Excerpt
> There a a few ways to assembles binaries for installation. Some binaries are easy in that they are already in the form of ISOs, like Windows or SQL installers. You could just attach them to a new V…

---
There a a few ways to assembles binaries for installation. Some binaries are easy in that they are already in the form of ISOs, like Windows or SQL installers. You could just attach them to a new VM and boot from them – but there are still a few gotchas which mean you need to think differently:

-   **One:** You need to get around the fact that Windows looks for a user to press a key to boot from CD rather than the blank VMDK assigned to the VM.
-   **Two:** It’s better (ie simpler in the long run) if you slipstream drivers required directly into the OS installer. In my case I need the NIC to be VMXNET3. If the driver isn’t present then the NIC won’t work, so joining a domain (at the time I want to) might be hard to do.
    -   If I use an E1000 initially (with the intent of swapping the card type and installing the VMXNET3 driver _after_ the OS is built and configured) then I will likely have trouble setting the IP address on the new NIC. This is because the OS will see it as a brand new card and there will be some cached settings in the OS for the IP on the old card.
    -   You’d also be past the point where Windows is in auto-install mode so setting the IP again at that point in the build without some user interaction is difficult.
-   **Three:** If you have multiple ISO based installers then you need to mount them all and know which ISO will be mounted to each drive letter. Not the end of the world put perhaps not the most elegant.
-   **Four:** What about exe based installers? Like SQL Management Studio that doesn’t come on an ISO?

Combining everything into a single binaries ISO answers all problems. To do this you use a combination of PowerShell and Windows ADK to:

-   Mount all the relevant ISOs
-   Copy files from the ISOs to a working folder
-   Mount the Windows Boot and Install WIM files from within the working folder
-   Inject VMXNET3 drivers into those WIM files as necessary
-   Dismount the WIM files
-   Replace the efiboot with one that doesn’t prompt user to press a key
-   Copy any other installers to locations in the working directory
-   Inject a SetupComplete.Cmd
    -   This is batch command, and given that I want to build it into a generic binaries ISO, it cant do specific things. So instead we will use it as a hook to an additional script (external to the binaries ISO) that we will supply separately to each VM
    -   This allows the same installer ISO to be used for all VMs even when they will have very different configurations. We’ll cover the content of this external script later
-   Create a custom bootable ISO from all the files we assembled in the working folder

### PowerShell Function

In general (as mentioned in post two in the series), I’m not going to show how each of the variables in the script gets a value (in the interests to focusing on the point). It suffices to say that they came from a JSON input, that was read in prior to the function being called. Keep in mind the scope of variables – if they are not Global, then they would need to be passed in as parameters to the function. If you need a bit of help, refer back to post two which shows you how to read and manipulate JSON content in PowerShell.

I will make the following exception in relation to the following two parameters, as they are key. etfsboot and efisys are crucial in making a bootable ISO that bypasses the first of our problem areas above i.e. Windows asking the user to press a key to boot from CD/DVD. The following two files included with the Windows ADK allow this.

```powershell
    $Global:etfsboot = "$ocsdimgPath\etfsboot.com"
    $Global:efisys   = "$ocsdimgPath\efisys_noprompt.bin"
```

The main function looks like this

```powershell
Function createCombinedISO
{
    $DestinationWindowsIsoPath = "$isosPath\combined-windows-sql-custom-installer.iso"

    LogMessage "Creating Temporary Folders"
    New-Item -ItemType Directory -Path $buildfolder | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\WorkingFolder" | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\VMwareTools" | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\MountDISM" | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\WorkingFolder\Software" | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\WorkingFolder\Software\SQL-Install" | Out-Null
    New-Item -ItemType Directory -Path "$buildfolder\SupportingFiles" | Out-Null
    New-Item -ItemType File -Path "$buildfolder\SupportingFiles\SetupComplete.cmd" | Out-Null
    Add-Content "$buildfolder\SupportingFiles\SetupComplete.cmd" 'powershell -file "E:\configure-host.ps1"'
    
    #Download VMware Tools ISO
    LogMessage "Downloading VMware Tools"
    $VMwareToolsIsoFullName = $VMwareToolsIsoUrl.split("/")[-1]
    $VMwareToolsIsoPath =  "$buildfolder\VMwareTools\$VMwareToolsIsoFullName"
    (New-Object System.Net.WebClient).DownloadFile($VMwareToolsIsoUrl, $VMwareToolsIsoPath)

    # mount the source Windows iso and get drive letter
    LogMessage "Mounting Windows ISO"
    $MountSourceWindowsIso = mount-diskimage -imagepath $SourceWindowsIsoPath -passthru
    $DriveSourceWindowsIso = ($MountSourceWindowsIso | get-volume).driveletter + ':'

    #Mount VMware tools ISO and get drive letter
    LogMessage "Mounting VMware Tools ISO"
    $MountVMwareToolsIso = mount-diskimage -imagepath $VMwareToolsIsoPath -passthru
    $DriveVMwareToolsIso = ($MountVMwareToolsIso  | get-volume).driveletter + ':'
    
    #Mount SQL tools ISO and get drive letter
    LogMessage "Mounting SQL ISO"
    $MountSQLsIso = mount-diskimage -imagepath $SourceSQLISOPath -passthru
    $DriveSQLIso = ($MountSQLsIso  | get-volume).driveletter + ':'

    # Copy the content of the Source Windows Iso to a Working Folder
    LogMessage "Copying Windows Files to Temporary Location"
    copy-item $DriveSourceWindowsIso\* -Destination "$buildfolder\WorkingFolder" -force -recurse
    
    # Copy the content of the SQL Iso to a SQL Folder
    LogMessage "Copying SQL Files to Temporary Location"
    copy-item $DriveSQLIso\* -Destination "$buildfolder\WorkingFolder\Software\SQL-Install" -force -recurse

    # remove the read-only attribute from the extracted files.
    get-childitem "$buildfolder\WorkingFolder" -recurse | %{ if (! $_.psiscontainer) { $_.isreadonly = $false } }

    #For 64 bits by default.
    copy-item "$DriveVMwareToolsIso\setup64.exe" -Destination "$buildfolder\WorkingFolder\Software"
    copy-item $SQlMgmtStudioPath -Destination "$buildfolder\WorkingFolder\Software\SQL-Install"
    
    #modify boot file
    Get-WindowsImage -ImagePath "$buildfolder\WorkingFolder\sources\boot.wim" | foreach-object {
        LogMessage "Modifying Windows Boot Image: $($_.ImageName)"
        Mount-WindowsImage -ImagePath "$buildfolder\WorkingFolder\sources\boot.wim" -Index ($_.ImageIndex) -Path "$buildfolder\MountDISM" | Out-Null
        Add-WindowsDriver -path "$buildfolder\MountDISM" -driver $vmxnet3Path -ForceUnsigned -WarningAction silentlyContinue | Out-Null
        LogMessage "Saving Image"
        Dismount-WindowsImage -path "$buildfolder\MountDISM" -save | Out-Null
    }

    LogMessage "Getting Windows Install Image Index for: $windowsVariant"
    $windowsVariantImage = Get-WindowsImage -ImagePath "$buildfolder\WorkingFolder\sources\install.wim" | where-Object {$_.'ImageName' -eq $windowsVariant}
    $windowsVariantImageIndex = $windowsVariantImage.ImageIndex

    #modify install file
    LogMessage "Modifying Windows Install Image: $($windowsVariantImage.ImageName)"
    Mount-WindowsImage -ImagePath "$buildfolder\WorkingFolder\sources\install.wim" -Index ($windowsVariantImageIndex) -Path "$buildfolder\MountDISM" | Out-Null
    Add-WindowsDriver -path "$buildfolder\MountDISM" -driver $vmxnet3Path -ForceUnsigned -WarningAction silentlyContinue | Out-Null
    LogMessage "Injecting Post Installation Files"
    New-Item -ItemType Directory "$buildfolder\MountDISM\Windows\Setup\Scripts" | Out-Null
    copy-item "$buildfolder\SupportingFiles\SetupComplete.cmd" -Destination "$buildfolder\MountDISM\Windows\Setup\Scripts"
    LogMessage "Saving Image"
    Dismount-WindowsImage -path "$buildfolder\MountDISM" -save | Out-Null

    #Create a new ISO and replace the boot files with those from Windows ADK.
    LogMessage "Creating Custom ISO: $DestinationWindowsIsoPath"
    $data = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f $etfsboot, $efisys
    start-process $oscdimg -args @("-bootdata:$data",'-u2','-udfver102', "$buildfolder\WorkingFolder", $DestinationWindowsIsoPath) -wait -nonewwindow -RedirectStandardError Null1 -RedirectStandardOutput Null2
    #Cleanup Working Folders
    LogMessage "Unmouting Stock ISOs"
    dismount-diskimage -imagepath $SourceWindowsIsoPath -passthru | Out-Null
    dismount-diskimage -imagepath $VMwareToolsIsoPath -passthru | Out-Null
    dismount-diskimage -imagepath $SourceSQLISOPath -passthru | Out-Null
    LogMessage "Removing Temporary Folders"
```

You’ll see a function called LogMessage mentioned above. Thats just another function I wrote to pretty up the screen output a bit. It looks like this

```powershell
Function LogMessage 
{
    param(
    [Parameter(Mandatory=$true)]
    [String]$message,
    [Parameter(Mandatory=$false)]
    [String]$colour,
    [Parameter(Mandatory=$false)]
    [string]$skipnewline
    )

    If (!$colour){
        $colour = "green"
    }

    $timeStamp = Get-Date -Format "MM-dd-yyyy_hh:mm:ss"

    Write-Host -NoNewline -ForegroundColor White " [$timestamp]"
    If ($skipnewline)
    {
        Write-Host -NoNewline -ForegroundColor $colour " $message"        
    }
    else 
    {
        Write-Host -ForegroundColor $colour " $message" 
    }

}
```

Next step creating the answer files!

### Posts in this Series

-   [Part 1: Overview](https://feardamhan.com/2020/01/14/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-i-overview/)
-   [Part 2: Reading JSON](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ii-sample-json-and-reading-it/)
-   [Part 3: Creating a Single Binaries ISO](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iii-building-a-single-binaries-iso/)
-   [Part 4: Understanding the autoUnattend.xml](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iv-understanding-and-building-the-autounattend-xml-file/)
-   [Part 5: Creating a Configure-Host.ps1 and Building the Answerfiles ISO for SQL Server](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-v-build-a-configure-host-ps1-and-answer-files-iso-for-sql-server/)
-   [Part 6: Creating the VM](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-vi-creating-and-configuring-the-vm/)
-   [Part 7: Creating a New Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
-   [Part 8: Adding a Domain Controller to an Existing Domain](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-viii-build-a-configure-host-ps1-and-answer-files-iso-for-new-domain-controller-in-existing-domain/)
-   [Part 9: Adding a New Child Domain to an Existing Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
