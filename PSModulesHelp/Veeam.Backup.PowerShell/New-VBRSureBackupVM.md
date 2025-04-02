New-VBRSureBackupVM
-------------------

### Synopsis
Defines VMs to add to the SureBackup job or to the application group.

---

### Description

This cmdlet creates the VBRSureBackupVM object that defines VMs that you want to add to the SureBackup job or to the application group.

---

### Related Links
* [New-VBRSureBackupStartupOptions](New-VBRSureBackupStartupOptions)

* [New-VBRSureBackupTestScript](New-VBRSureBackupTestScript)

* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Example 1. Defining VM and VM Roles to Add to Application Group Using Job

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job -Name "Winsrv2047"
New-VBRSureBackupVM -VM $backupobject -Role MailServer
This example shows how to define an application group settings. The cmdlet will add Winsrv2047 VM to the application group using a job and will assign the mail server role to this VM.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter value. Save the result to the $backupobject variable.
3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Set the MailServer option as the Role parameter value.
> Example 2. Defining VM and VM Roles to Add to Application Group Using Restore Point

$backup = Get-VBRBackup -Name "MSExchange"
$restPoint = Get-VBRRestorePoint -Name "Winsrv2047" -Backup $backup
New-VBRSureBackupVM -RestorePoint $restPoint -Role MailServer
This example shows how to define an application group settings. The cmdlet will add Winsrv2047 VM to the application group using a restore point and will assign the mail server role to this VM.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value. Save the result to the $restPoint variable.
3. Run the New-VBRSureBackupVM cmdlet. Set the $restPoint variable as the RestorePoint parameter value. Set the MailServer option for the Role parameter.
> Example 3. Defining Verification Script for VM

$script = New-VBRSureBackupTestScript -PredefinedApplication DNSServer
$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job Name "Winsrv2047"
New-VBRSureBackupVM -VM $backupobject -Role DNSServer -TestScript $script
This example shows how to define the Winsrv2047 VM to add to the application group. The cmdlet will define the Winsrv2047 VM with the following settings:
- The Winsrv2047 VM will have the DNS Server role.
- Veeam Backup & Replication will run a script to verify applications inside the Winsrv2047 VM.
Perform the following steps:
1. Run the New-VBRSureBackupTestScript cmdlet. Set the DNSServer option for the PredefinedApplication parameter. Save the result to the $script variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter value. Save the result to the $backupobject variable.
4. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Set the DNSServer option for the Role parameter. Set the $script variable as the TestScript parameter value.
> Example 4. Defining Startup settings of VMs

$startupoptions = New-VBRSureBackupStartupOptions -MaximumBootTime 200  -ApplicationInitializationTimeout 150 -AllocatedMemory 80 -PingCheck -HeartbeatCheck
$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job Name "Winsrv2047"
New-VBRSureBackupVM -VM $backupobject -Role DNSServer -StartupOptions $startupoptions
This example shows how to define the Winsrv2047 VM to add to the application group. The cmdlet will define the Winsrv2047 VM with the following settings:
- The Winsrv2047 VM will have the DNS Server role.
- Veeam Backup & Replication will run a script to verify applications inside the Winsrv2047 VM.
- The period that is required for VMs to boot is set to 200 seconds.
- The timeout required to initialize applications on VMs is set to 150 seconds.
- The amount of memory provided for VMs is set to 80 percent.
Perform the following steps:
1. Run the New-VBRSureBackupStartupOptions cmdlet. Specify the necessary parameters. Save the result to the $startupoptions variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Specify the Name parameter value. Save the result to the $backupobject variable.
4. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Set the DNSServer option for the Role parameter. Set the $startupoptions variable as the StartupOptions parameter value.
> Example 5. Excluding VMs From SureBackup Job

$sbjob = Get-VBRSureBackupJob
$bjob = Get-VBRJob -Name "Backup"
$vm = Get-VBRJobObject -Job $bjob -Name "Winsrv2047"
$sbvm = New-VBRSureBackupVM -VM $vm -Exclude
This example shows how to exclude the Winsrv2047 VM from the SureBackup job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Save the result to the $sbjob variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $bjob variable.
3. Run the Get-VBRJobObject cmdlet. Set the $bjob variable as the Job parameter value. Specify the Name parameter value. Save the result to the $vm variable.
4. Run the New-VBRSureBackupVM cmdlet. Set the $vm variable as the VM parameter value. Provide the Exclude parameter.

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

#### **RestorePoint**
Specifies VMs added to a restore point. The cmdlet will add these VMs to the SureBackup job or to the application group.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Role**
Specifies a role of VMs that you want to add to the SureBackup job or to the application group.
The cmdlet will assign the specified role to VMs. You can specify either of the following roles:
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
Specifies startup settings for VMs that you want to add to the application group.
Veeam Backup & Replication will apply these startup options to VMs.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRSureBackupStartupOptions]`|false   |named   |False        |

#### **TestScript**
Specifies a script for VMs that you want to add to the SureBackup job or to the application group. Veeam Backup & Replication will run this script to verify the role of VMs.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRSureBackupTestScript[]]`|false   |named   |False        |

#### **VM**
Specifies VMs added to a job. The cmdlet will add these VMs to the SureBackup job or to the application group.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CObjectInJob]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CObjectInJob

Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRSureBackupVM [-Credentials <CCredentials>] [-Exclude] -RestorePoint <COib> [-Role {DNSServer | GlobalCatalog | MailServer | SQLServer | WebServer | DomainControllerAuthoritative | 
```
```PowerShell
DomainControllerNonAuthoritative | VBO}] [-StartupOptions <VBRSureBackupStartupOptions>] [-TestScript <VBRSureBackupTestScript[]>] [<CommonParameters>]
```
```PowerShell
New-VBRSureBackupVM [-Credentials <CCredentials>] [-Exclude] [-Role {DNSServer | GlobalCatalog | MailServer | SQLServer | WebServer | DomainControllerAuthoritative | DomainControllerNonAuthoritative | VBO}] 
```
```PowerShell
[-StartupOptions <VBRSureBackupStartupOptions>] [-TestScript <VBRSureBackupTestScript[]>] -VM <CObjectInJob> [<CommonParameters>]
```
