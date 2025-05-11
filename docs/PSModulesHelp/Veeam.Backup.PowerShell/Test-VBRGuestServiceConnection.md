Test-VBRGuestServiceConnection
------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **DisableVix**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **VirtualLab**

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[ISbVirtualLab]`|false   |named   |True (ByPropertyName)|

#### **Vm**

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[IVmItem]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.IVmItem

Veeam.Backup.Core.SureBackup.ISbVirtualLab

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Test-VBRGuestServiceConnection [-DisableVix] -Password <String> -User <String> [-VirtualLab <ISbVirtualLab>] -Vm <IVmItem> [<CommonParameters>]
```
