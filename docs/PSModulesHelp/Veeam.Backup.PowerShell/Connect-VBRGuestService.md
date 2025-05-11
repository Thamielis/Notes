Connect-VBRGuestService
-----------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **ClientId**

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **DisableVix**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Ttl**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

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

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRGuestService [-ClientId <Guid>] [-DisableVix] -Password <String> [-RunAsync] [-Ttl <TimeSpan>] -User <String> [-VirtualLab <ISbVirtualLab>] -Vm <IVmItem> [<CommonParameters>]
```
