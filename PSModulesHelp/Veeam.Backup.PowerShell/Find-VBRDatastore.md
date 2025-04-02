Find-VBRDatastore
-----------------

### Synopsis
Returns a list of VMware datastores connected to the specified ESX(i) host.

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
Find-VBRDatastore [-Server] <CHost> [-Name <String[]>] [<CommonParameters>]
```
