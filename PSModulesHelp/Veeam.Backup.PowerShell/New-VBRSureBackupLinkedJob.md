New-VBRSureBackupLinkedJob
--------------------------

### Synopsis
Defines jobs linked with the SureBackup job.

---

### Description

This cmdlet creates the VBRSureBackupLinkedJob object that defines jobs linked with the SureBackup job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [New-VBRSureBackupTestScript](New-VBRSureBackupTestScript)

* [New-VBRSureBackupStartupOptions](New-VBRSureBackupStartupOptions)

---

### Examples
> Example 1. Defining Linked Job with Verification Script

$job = Get-VBRJob -Name "Exchange Job"
$script = New-VBRSureBackupTestScript -PredefinedApplication GlobalCatalog
New-VBRSureBackupLinkedJob -Job $job -Role GlobalCatalog -TestScript $script
This example shows how to define a linked job that will be verified with the SureBackup job. Veeam Backup & Replication will run a verification script to verify the VM with the Global Catalog role has up and running applications for this role.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSureBackupTestScript cmdlet. Specify the GlobalCatalog option as the PredefinedApplication parameter value. Save the result to the $script variable.
3. Run the New-VBRSureBackupLinkedJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Specify the GlobalCatalog as the Role parameter value.
- Set the $script variable as the TestScript parameter value.
> Example 2. Defining Linked Job with Startup Options

$job = Get-VBRJob -Name "Exchange Job"
$startup = New-VBRSureBackupStartupOptions -MaximumBootTime 200 -ApplicationInitializationTimeout 150 -AllocatedMemory 80 -PingCheck -HeartbeatCheck
New-VBRSureBackupLinkedJob -Job $job -StartupOptions $startup
This example shows how to define a linked job that will be verified with the SureBackup job.
Veeam Backup & Replication will run a verification script to verify the VM with the Global Catalog role has up and running applications for this role.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSureBackupStartupOptions cmdlet. Specify the necessary parameters. Save the result to the $startup variable.
3. Run the New-VBRSureBackupLinkedJob cmdlet. Set the $job variable as the Job parameter value. Set the $startup variable as the StartupOptions parameter value.

---

### Parameters
#### **Credentials**
Specifies credentials. The cmdlet will use these credentials to authenticate against the VM and to run a recovery verification script.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Job**
Specify a backup or replication job. Veeam Backup & Replication will verify VMs from this job with the SureBackup job.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Role**
Specifies a role that VM from the linked job performs. You can specify either of the following roles:
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
Specifies startup settings for VMs from the linked job.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRSureBackupStartupOptions]`|false   |named   |False        |

#### **TestScript**
Specifies recovery verification scripts for VMs from the linked job.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRSureBackupTestScript[]]`|false   |named   |False        |

#### **VM**
Specifies an array of VMs. The cmdlet will run a verification script on these VMs.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRSureBackupVM[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRSureBackupLinkedJob [-Credentials <CCredentials>] -Job <CBackupJob> [-Role {DNSServer | GlobalCatalog | MailServer | SQLServer | WebServer | DomainControllerAuthoritative | 
```
```PowerShell
DomainControllerNonAuthoritative | VBO}] [-StartupOptions <VBRSureBackupStartupOptions>] [-TestScript <VBRSureBackupTestScript[]>] [-VM <VBRSureBackupVM[]>] [<CommonParameters>]
```
