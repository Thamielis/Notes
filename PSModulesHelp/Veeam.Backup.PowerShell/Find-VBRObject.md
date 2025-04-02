Find-VBRObject
--------------

### Synopsis
Returns a list of all VMs and VM containers on the specified ESX(i) host.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Name**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRObject [-Server] <CHost> [-Name <String[]>] [<CommonParameters>]
```
