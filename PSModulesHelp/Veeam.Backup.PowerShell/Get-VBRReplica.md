Get-VBRReplica
--------------

### Synopsis
Returns VM replicas or cloud VM replicas.

---

### Description

This cmdlet returns VM replicas or cloud VM replicas managed by Veeam Backup & Replication.
You can look for all VM replicas or for replicas created by a particular replication job.
With this cmdlet, you call get the replicas that are managed by your backup console. In case you have removed some replicas from the Veeam Backup & Replication console, but they remain on disk, you will not be able to get them.

---

### Examples
> Example 1

Get-VBRReplica
This command looks for all replicas managed by Veeam Backup & Replication.
> Example 2

```PowerShell
Get-VBRReplica -Name "DC Replica"
This command looks for the replicas created with the replication job.
```

---

### Parameters
#### **Name**
Specifies the array of names of replicated VM. The cmdlet will return replicated VMs with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the type of the replica you want to get:
* Local: non-cloud replicas.
* Cloud: [for cloud user] cloud replicas.
* Tenant: [for cloud provider] cloud replicas created by cloud user.
The cmdlet will return replicated VMs of the selected type.
Valid Values:

* Local
* Cloud
* Tenant
* CloudvCD

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRReplicaType]`|false   |named   |False        |

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
Get-VBRReplica [-Name <String[]>] [-Type {Local | Cloud | Tenant | CloudvCD}] [<CommonParameters>]
```
