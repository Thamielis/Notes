Generate-VBRCloudSubTenantSecondaryPassword
-------------------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **CloudSubtenant**

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[IVBRCloudSubTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Key**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudSubTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Generate-VBRCloudSubTenantSecondaryPassword -CloudSubtenant <IVBRCloudSubTenant> [-Description <String>] -Key <String> [-Password <String>] [<CommonParameters>]
```
