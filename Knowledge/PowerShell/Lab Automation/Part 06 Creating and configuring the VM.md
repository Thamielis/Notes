---
created: 2022-03-04T13:00:25 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-vi-creating-and-configuring-the-vm/
author: Published by feardamhan
---

# Lab Automation: Unattended Windows Deployments including AD Forests, Domains and SQL server – Part VI: Creating and configuring the VM – FearDamhan

> ## Excerpt
> Now that we have all the supporting material lets create a short PowerShell script that creates the VM with: User specified hardware settingsCorrect boot environmentAdditional CD ROM for answer fil…

---
![](https://feardamhancom.files.wordpress.com/2019/03/powershell-snippets-e1587134370628.png?w=371)

Now that we have all the supporting material lets create a short PowerShell script that creates the VM with:

-   User specified hardware settings
-   Correct boot environment
-   Additional CD ROM for answer files
-   Mounts the ISOs
-   Starts the VM
-   Launches VMware Remote Console (so that we can watch our baby grow! )

### PowerShell Script

```powershell
Function newAutoDeployedVM
{
    Param(
    [Parameter(mandatory=$true)]
    [String]$target,
    [Parameter(mandatory=$true)]
    [Array]$domainDetails,
    [Parameter(mandatory=$true)]
    [String]$environmentType,
    [Parameter(mandatory=$true)]
    [Array]$sharedDetails,
    [Parameter(mandatory=$true)]
    [String]$machinetype,
    [Parameter(mandatory=$true)]
    [String]$CPU,
    [Parameter(mandatory=$true)]
    [String]$memory,
    [Parameter(mandatory=$true)]
    [String]$disk
    )

    #Set Variables to use from inputs
    $Global:primaryEsxiUsername = $sharedDetails.hostCredentials.esxiUsername
    $Global:primaryEsxiPassword = $sharedDetails.hostCredentials.esxiPassword
    $Global:primaryEsxiDatastore = $domainDetails.nfs.DatastoreName
    $Global:primaryEsxiHost = $domainDetails.hosts[0].mgmtIp
    $Global:PrimaryEsxiNetwork = $domainDetails.network.vmPortgroupName
    connectHost $domainDetails.hosts[0] $sharedDetails
    LogMessage "Creating $($domainDetails.templates.$machinetype.machinename) on $primaryEsxiHost"
    
    #Create VM with variables passed for VM Spec
    New-VM -Name $vmName -Datastore $primaryEsxiDatastore -NumCPU $CPU -MemoryGB $memory -DiskGB $disk -NetworkName $PrimaryEsxiNetwork -Floppy -CD -DiskStorageFormat Thin -GuestID windows9Server64Guest

    #Change NIC to VMXNET3
    LogMessage "Setting Network Adapter to VMXNET3"
    Get-VM -name $vmName | Get-NetworkAdapter | Set-NetworkAdapter -Type Vmxnet3 -confirm:$false  | Out-File $logFile -encoding ASCII -append
    
    #Set first CD-ROM to combined binaries ISO on specifed datastore
    $customIsoPath = '['+$primaryEsxiDatastore+"] \ISOs\combined-windows-sql-custom-installer.iso"
    LogMessage "Mounting $customIsoPath to CD 1"
    $cd = Get-VM -name $vmName | Get-CDDrive
    Set-CDDrive -cd $cd -IsoPath $customIsoPath -StartConnected:$true -confirm:$false | Out-File $logFile -encoding ASCII -append
    
    #Add second CD-ROM. Set to relevant answerfiles ISO on specifed datastore
    $configIsoPath = '['+$primaryEsxiDatastore+"] \ISOs\$environment-$($domainDetails.templates.$machinetype.machinename)-answerfiles.iso"
    LogMessage "Mounting $configIsoPath to CD 2"
    $vm = Get-VM $vmName 
    New-CDDrive -vm $vm -ISOPath $configIsoPath -StartConnected:$true | Out-File $logFile -encoding ASCII -append

    #Set correct boot firmware type
    LogMessage "Reconfiguring Boot Firmware Type to EFI"
    $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $spec.Firmware = [VMware.Vim.GuestOsDescriptorFirmwareType]::efi
    $vm.ExtensionData.ReconfigVM($spec)

    # Start VM
    LogMessage "Starting $($domainDetails.templates.$machinetype.machinename). Please monitor VM Console for completion"
    $vm | start-vm | Out-File $logFile -encoding ASCII -append #| Out-Null

    #Opening Console of new VM
    LogMessage "Opening Console of $($domainDetails.templates.$machinetype.machinename) if VMRC is installed"
    $ServiceInstance = Get-View -Id ServiceInstance
    $SessionManager = Get-View -Id $ServiceInstance.Content.SessionManager
    $vmrcURI = "vmrc://clone:" + ($SessionManager.AcquireCloneTicket()) + "@" + $global:DefaultVIServer.Name + "/?moid=" + $vm.ExtensionData.MoRef.Value
    Start-Process -FilePath $vmrcURI
    Disconnect-viserver * -confirm:$false
}
```

Ok. Thats all you need to get your first VM done. I’ll add more posts in the next week or two with the specifics for automating the other types of VMs I promised.

### Pretty Pictures

Just a few screenshots of the build process in action

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-01-1.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-02.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-03.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-04.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-05.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-06-1.png?w=1024)

![](https://feardamhancom.files.wordpress.com/2020/01/sql-server-screen-07.png?w=1024)

Eh voila! Give it a go in your lab. Hope it saves you some time.

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
