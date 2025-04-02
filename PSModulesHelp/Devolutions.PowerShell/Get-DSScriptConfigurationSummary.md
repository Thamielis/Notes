Get-DSScriptConfigurationSummary
--------------------------------

### Synopsis
Get a summary of the PAM script configurations

---

### Description

Get a summary of the PAM script configurations. The summary includes the configuration's ID, name, and template ID.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSScriptConfigurationSummary -Name 'My script config' | Select -ExpandProperty ID
Retrieve the ID of the configuration named 'My script config'
```

---

### Parameters
#### **CaseSensitive**
Case sensitive search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
Filter the script configurations by their name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.models.PamScriptConfigurationSummary[]

---

### Notes
For more information, type "Get-Help Get-DSScriptConfigurationSummary -detailed". For technical information, type "Get-Help Get-DSScriptConfigurationSummary -full".

---

### Syntax
```PowerShell
Get-DSScriptConfigurationSummary [[-Name] <String>] [-CaseSensitive] [<CommonParameters>]
```
