Set-VBRSureBackupVM
-------------------

### Synopsis
Modifies settings of VMs added to the SureBackup job or to the application group.

---

### Description

This cmdlet modifies settings of VMs added to the SureBackup job or to the application group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

* [New-VBRSureBackupVM](New-VBRSureBackupVM)

* [New-VBRApplicationGroupStartupOptions](New-VBRApplicationGroupStartupOptions)

---

### Examples
> Example 1. Modifying Role of VM

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job -Name "Winsrv2047"
$vm = New-VBRSureBackupVM -VM $backupobject -Role MailServer
Set-VBRSureBackupVM -VM $vm -Role GlobalCatalog
This example shows how to modify a role of the VM that you want to add to the application group.
The cmdlet will change the role of the VM from the Mail Server role to the Global Catalog role.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter value. Save the result to the $backupobject variable.
3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Set the MailServer option for the Role parameter.
4. Run the Set-VBRSureBackupVM cmdlet. Set the $vm variable as the VM parameter value. Set the GlobalCatalog option for the Role parameter.
> Example 2. Modifying Startup Settings of VMs

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job -Name "Winsrv2047"
$vm = New-VBRSureBackupVM -VM $backupobject -Role MailServer
$startupoptions = New-VBRApplicationGroupStartupOptions -MaximumBootTime 100 -ApplicationInitializationTimeout 150 -AllocatedMemory 60
Set-VBRSureBackupVM -VM $vm -StartupOptions $startupoptions
This example shows how to modify startup settings of the VM that you want to add to the application group. The VM will have the following startup settings:
- The period that is required for VMs to boot is set to 100 seconds.
- The timeout required to initialize applications on VMs is set to 150 seconds.
- The amount of memory provided for VMs is set to 60 percent.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter value. Save the result to the $backupobject variable.
3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Set the MailServer option for the Role parameter. Save the result to the $vm variable.
4. Run the New-VBRApplicationGroupStartupOptions cmdlet. Specify the MaximumBootTime, ApplicationInitializationTimeout and AllocatedMemory parameter values. Save the result to the $startupoptions variable.
5. Run the Set-VBRSureBackupVM cmdlet. Set the $vm variable as the VM parameter value. Set the $startupoptions variable as the StartupOptions parameter value.

---

### Parameters
#### **Credentials**
Specifies credentials to access VMs and run verification scripts.
If you do not specify this parameter, the cmdlet will use the account under which Veeam Backup & Replication is currently running.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Exclude**
Defines that the cmdlet will exclude VMs from the SureBackup job.
You can exclude VMs from the SureBackup job only if they were added through the linked backup or replication job.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Role**
Specifies roles of VMs that you want to add to the application group. The cmdlet will assign the specified role to VMs. You can specify either of the following roles:
* DNSServer
* GlobalCatalog
* MailServer
* SQLServer
* WebServer
* DomainControllerAuthoritative
* DomainControllerNonAuthoritative
* VBO
Valid Values:

* DNSServer
* GlobalCatalog
* MailServer
* SQLServer
* WebServer
* DomainControllerAuthoritative
* DomainControllerNonAuthoritative
* VBO

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRSureBackupRole[]]`|false   |named   |False        |

#### **StartupOptions**
Specifies startup settings for VMs that you want to add to the application group. Veeam Backup & Replication will apply these startup options to VMs.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRSureBackupStartupOptions]`|false   |named   |False        |

#### **TestScript**
Specifies a script for VMs that you want to add to the application group. Veeam Backup & Replication will run this script to verify the role of VMs.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRSureBackupTestScript[]]`|false   |named   |False        |

#### **VM**
Specifies a VM whose settings you want to modify.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRSureBackupVM]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupVM

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupVM [-Credentials <CCredentials>] [-Exclude] [-Role {DNSServer | GlobalCatalog | MailServer | SQLServer | WebServer | DomainControllerAuthoritative | DomainControllerNonAuthoritative | VBO}] 
```
```PowerShell
[-StartupOptions <VBRSureBackupStartupOptions>] [-TestScript <VBRSureBackupTestScript[]>] -VM <VBRSureBackupVM> [<CommonParameters>]
```
