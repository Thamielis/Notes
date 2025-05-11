Register-DSServerLicense
------------------------

### Synopsis
Register the server license

---

### Description

Register the server license. For the other licenses, use the cmdlet Register-DSLicense. Using this cmdlet will overwrite the existing server serial if it is already set.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Register-DSServerLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
Set the server license
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Serial**
Server serial

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Register-DSServerLicense -detailed". For technical information, type "Get-Help Register-DSServerLicense -full".

---

### Syntax
```PowerShell
Register-DSServerLicense -Serial <String> [-AsLegacyResponse] [<CommonParameters>]
```
