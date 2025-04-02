Add-VBRTapeVault
----------------

### Synopsis
Creates a tape vault.

---

### Description

This cmdlet creates a new tape vault.

---

### Examples
> Example 1 Creating Tape Vault

```PowerShell
Add-VBRTapeVault -Name "Sydney Remote Storage" -Description "Veeam backups offsite"
This command creates a vault named 'Sydney Remote Storage'.
```

---

### Parameters
#### **Description**
Specifies the description of the vault. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Protect**
Defines that all tapes moved to this media vault automatically get lifelong overwrite protection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRTapeVault [-Description <String>] -Name <String> [-Protect] [<CommonParameters>]
```
