Get-VBRReplicaStatus
--------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Replica**

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[CReplica[]]`|true    |named   |True (ByPropertyName)|

#### **RestorePoint**

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib[]

Veeam.Backup.Core.CReplica[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRReplicaStatus -Replica <CReplica[]> [<CommonParameters>]
```
```PowerShell
Get-VBRReplicaStatus -RestorePoint <COib[]> [<CommonParameters>]
```
