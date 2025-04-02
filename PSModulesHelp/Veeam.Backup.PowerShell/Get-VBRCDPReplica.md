Get-VBRCDPReplica
-----------------

### Synopsis
Returns CDP replicas created by CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.

---

### Description

This cmdlet returns CDP replicas created by CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.

---

### Examples
> Example 1. Getting VM Protected with CDP by Name

```PowerShell
Get-VBRCDPReplica -Name "Win07"
This command returns the Win07 VM protected with CDP.
```
> Example 2. Getting VM Protected with CDP by ID

```PowerShell
Get-VBRCDPReplica -Id "13744fce-e8ea-4b77-9092-26e3f09e6a6e"
This command returns the 13744fce-e8ea-4b77-9092-26e3f09e6a6e VM protected with CDP.
```
> Example 3. Getting all VMs Protected with CDP Available in Backup Infrastructure

```PowerShell
Get-VBRCDPReplica
This command returns all VMs protected with CDP that are available in the backup Infrastructure
```

---

### Parameters
#### **Id**
Specifies an array of IDs of workloads protected by CDP.
The cmdlet will return a list of replicas of the workloads with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names of workloads protected by CDP.
The cmdlet will return a list of replicas of the workloads with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies which type of replicas to get:
* Local: use this option to get local CDP and Cloud Director CDP replicas. The cmdlet will return replicas created not using Cloud Connect.
* Tenant: use this option to get CDP replicas available on the tenant side. The cmdlet will return replicas created using Cloud Connect.
* Cloud: use this option to get CDP replicas available on the Service Provider side. The cmdlet will return replicas created using Cloud Connect during the CDP to VMware scenario.
* Cloudvcd: use this option to get CDP replicas available on the Service Provider side. The cmdlet will return replicas created using Cloud Connect during the CDP to VMware Cloud Director scenario.
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
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPReplica [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPReplica [-Name <String[]>] [-Type {Local | Cloud | Tenant | CloudvCD}] [<CommonParameters>]
```
