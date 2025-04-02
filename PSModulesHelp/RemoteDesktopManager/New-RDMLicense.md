New-RDMLicense
--------------

### Synopsis
Create a new license instance.

---

### Description

Create a license instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMLicense $s" to save the license.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-RDMLicense -Serial "a-valid-serial-123" -AutoAssign -SetLicense
Create & save a new license that will be automatically assigned to new users.
```

---

### Parameters
#### **AutoAssign**
Auto assign new users to automatically provide the Remote Desktop Manager serial to all newly created users. For others serials, it will be ignored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **Serial**
New license serial.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetLicense**
Save the new license.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo

---

### Notes
For more information, type "Get-Help New-RDMLicense -detailed". For technical information, type "Get-Help New-RDMLicense -full".

---

### Syntax
```PowerShell
New-RDMLicense [-Serial] <String> [[-SetLicense]] [[-AutoAssign]] [<CommonParameters>]
```
