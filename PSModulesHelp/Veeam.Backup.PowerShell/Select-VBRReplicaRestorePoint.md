Select-VBRReplicaRestorePoint
-----------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Force**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Last**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **RestorePoint**

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[COib]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Select-VBRReplicaRestorePoint [-Force] [-Last] -RestorePoint <COib> [<CommonParameters>]
```
