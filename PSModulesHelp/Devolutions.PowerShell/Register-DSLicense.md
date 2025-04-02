Register-DSLicense
------------------

### Synopsis
Register a new license

---

### Description

Register a new license. For the server license, use the cmdlet Register-DSServerLicense.
For the AutoAssign parameter, it will be ignored for modules, except the Gateway module. Some examples of modules: CyberArk Integration, Delinea Integration, and Privileged Access Management (PAM).

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Register-DSLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX -AutoAssign
Add a new license with the AutoAssign set
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoAssign**
Auto assign new users. Ignored for modules, such as the PAM module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Serial**
Serial to add to the DVLS instance

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
For more information, type "Get-Help Register-DSLicense -detailed". For technical information, type "Get-Help Register-DSLicense -full".

---

### Syntax
```PowerShell
Register-DSLicense -Serial <String> [-AutoAssign] [-AsLegacyResponse] [<CommonParameters>]
```
