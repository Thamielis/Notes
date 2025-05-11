Set-DPSAppSettings
------------------

### Synopsis

---

### Description

---

### Parameters
#### **ApplicationPath**
Directory of the application

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AppSettings**
Directory of the application

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AppSettingsFile]`|true    |named   |false        |

#### **Encrypt**
Encrypt the connection strings

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-DPSAppSettings -detailed". For technical information, type "Get-Help Set-DPSAppSettings -full".

---

### Syntax
```PowerShell
Set-DPSAppSettings -AppSettings <AppSettingsFile> -ApplicationPath <String> [-Encrypt] [<CommonParameters>]
```
