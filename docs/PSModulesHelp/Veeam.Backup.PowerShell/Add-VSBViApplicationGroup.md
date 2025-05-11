Add-VSBViApplicationGroup
-------------------------

### Synopsis
Creates an application group for SureBackup job.

---

### Description

Application groups are created to set a list of VMs that should be running together during the verification. It is used with VMs that are dependent on services running on other VMs, such as a domain controller or a DNS server. The VMs in the application group are started first to ensure the proper testing environment.

Keep in mind that all VMs from the application group must belong to the same platform - VMware or Hyper-V, and must have at least one valid restore point created by the time the SureBackup job starts.

The created application group can be reused by several SureBackup jobs.

This cmdlet provides two scenarios. You can add VMs to your application group either by searching for existing VMs or by adding a restore point containing the VMs you need.

Note that you can set the order the VMs in the application group will be powered on when the SureBackup job starts. This may be important if any of the applications must be started prior to other. The VMs are powered in the order they were added to the VM object in this cmdlet, i.e. in order you searched for VMs with Find-VBRViEntity.

---

### Examples
> Example 1

```PowerShell
Find-VBRViEntity -Name "DC", "DNSServer" | Add-VSBHvApplicationGroup -Name "Microsoft Exchange Appgroup"
This command creates a new application group named "Microsoft Exchange Appgroup". The VMs that should be included into the application group are obtained with Find-VBRViEntity and piped down. The VMs are obtained in the order they must boot when the SureBackup job starts.
```
> Example 2

```PowerShell
Add-VSBViApplicationGroup -Name "MailServer Appgroup" -RestorePoint $restorepoint
This command creates a new application group "MailServer Appgroup". The restore point object is obtained with Get-VBRRestorePoint and assigned to the variable beforehand.
```

---

### Parameters
#### **Name**
Specifies the name you want to assign to the application group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore points of the VMs you want to add to the application group.  You can assign multiple restore points to this object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **VmFromBackup**
Used for adding VMs from backup. Specifies the VM(s) that you want to add to the application group. Veeam Backup & Replication will search for backup jobs that contain the specified VMs and use the most recent restore points of them. You can assign multiple VMs to this object.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CViVmItem[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **VmFromReplica**
Used for adding VMs from replicas. Specifies the VM(s) that you want to add to the application group. Veeam Backup & Replication will search for replication  jobs that contain the specified VMs and use the most recent restore points of them. You can assign multiple VMs to this object.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CViVmItem[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViVmItem[]

Veeam.Backup.Core.COib[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VSBViApplicationGroup [-Name <String>] [-RestorePoint <COib[]>] [-VmFromBackup <CViVmItem[]>] [-VmFromReplica <CViVmItem[]>] [<CommonParameters>]
```
