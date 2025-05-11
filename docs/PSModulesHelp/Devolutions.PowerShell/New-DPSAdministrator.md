New-DPSAdministrator
--------------------

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

#### **Email**
Administrator email

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Name**
Administrator name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Password**
Administrator password

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
For more information, type "Get-Help New-DPSAdministrator -detailed". For technical information, type "Get-Help New-DPSAdministrator -full".

---

### Syntax
```PowerShell
New-DPSAdministrator -ConnectionString <String> -Name <String> -Password <String> -Email <String> [<CommonParameters>]
```
