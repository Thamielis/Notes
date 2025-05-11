Start-VSDKDiskRestore
---------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **DiskRestoreOptions**

|Type                        |Required|Position|PipelineInput        |
|----------------------------|--------|--------|---------------------|
|`[VSDKDiskRestoreOptions[]]`|true    |named   |True (ByPropertyName)|

#### **RestoreSession**

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VSDKRestoreSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VSDKRestoreSession

Veeam.Backup.PowerShell.Infos.VSDKDiskRestoreOptions[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VSDKDiskRestore -DiskRestoreOptions <VSDKDiskRestoreOptions[]> -RestoreSession <VSDKRestoreSession> [<CommonParameters>]
```
