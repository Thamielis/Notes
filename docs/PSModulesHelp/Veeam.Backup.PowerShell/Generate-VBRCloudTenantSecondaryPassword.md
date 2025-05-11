Generate-VBRCloudTenantSecondaryPassword
----------------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **CloudTenant**

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Generate-VBRCloudTenantSecondaryPassword -CloudTenant <IVBRCloudTenant> [-Description <String>] -Key <String> [-Password <String>] [<CommonParameters>]
```
