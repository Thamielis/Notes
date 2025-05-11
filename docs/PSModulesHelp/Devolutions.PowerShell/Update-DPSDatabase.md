Update-DPSDatabase
------------------

### Synopsis

---

### Description

---

### Parameters
#### **ConnectionString**
Connection string found in appsettings.json

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **InstallationPath**
Folder containing the Devolutions.DatabaseUpgrade.dll

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Update-DPSDatabase -detailed". For technical information, type "Get-Help Update-DPSDatabase -full".

---

### Syntax
```PowerShell
Update-DPSDatabase -InstallationPath <String> -ConnectionString <String> [<CommonParameters>]
```
