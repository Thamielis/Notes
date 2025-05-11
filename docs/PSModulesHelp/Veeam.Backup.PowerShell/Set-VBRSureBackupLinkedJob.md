Set-VBRSureBackupLinkedJob
--------------------------

### Synopsis
Modifies settings of jobs linked with the SureBackup job.

---

### Description

This cmdlet modifies settings of jobs linked with the SureBackup job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Modifying Roles of VMs Added to Linked Job

$job = Get-VBRJob -Name "Exchange Job"
Set-VBRSureBackupLinkedJob -Job $job -Role SQLServer
This example shows how to assign the SQLServer role to VMs that are added to the Exchange Job linked job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRSureBackupLinkedJob cmdlet. Set the $job variable as the Job parameter value. Set the SQLServer option for the Role parameter.

---

### Parameters
#### **Credentials**
Specifies credentials. The cmdlet will use these credentials to authenticate against the VM and to run a recovery verification script.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Job**
Specify a backup or replication job. Veeam Backup & Replication will verify VMs from this job with the SureBackup job.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|false   |named   |False        |

#### **LinkedJob**
Specify a job linked with the SureBackup job. Veeam Backup & Replication will modify settings of this linked job.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRSureBackupLinkedJob]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupLinkedJob [-Credentials <CCredentials>] [-Job <CBackupJob>] -LinkedJob <VBRSureBackupLinkedJob> [-Role {DNSServer | GlobalCatalog | MailServer | SQLServer | WebServer | 
```
```PowerShell
DomainControllerAuthoritative | DomainControllerNonAuthoritative | VBO}] [-StartupOptions <VBRSureBackupStartupOptions>] [-TestScript <VBRSureBackupTestScript[]>] [-VM <VBRSureBackupVM[]>] [<CommonParameters>]
```
