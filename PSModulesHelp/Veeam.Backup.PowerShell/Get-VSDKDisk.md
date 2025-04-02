Get-VSDKDisk
------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **RestorePoint**

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[COib]`|true    |named   |True (ByPropertyName)|

#### **Session**

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VSDKSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VSDKSession

Veeam.Backup.Core.COib

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VSDKDisk [-Name <String>] -RestorePoint <COib> -Session <VSDKSession> [<CommonParameters>]
```
