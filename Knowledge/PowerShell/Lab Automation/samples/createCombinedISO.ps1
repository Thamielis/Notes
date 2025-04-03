

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
    get-childitem "$buildfolder\WorkingFolder" -recurse | ForEach-Object { if (! $_.psiscontainer) { $_.isreadonly = $false } }

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
}
