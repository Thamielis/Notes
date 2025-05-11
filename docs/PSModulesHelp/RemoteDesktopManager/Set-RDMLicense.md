Set-RDMLicense
--------------

### Synopsis
Save/set the license.

---

### Description

Save/set the license. License must be first fetch via license property of the Get-RDMLicense cmdlet or via the New-RDMLicense result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $license = New-RDMLicense -Name "New License" ;Set-License $license
Create & save new license.
```

---

### Parameters
#### **AutoAssign**
Auto assign new users to automatically provide the Remote Desktop Manager serial to all newly created users. For others serials, it will be ignored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **License**
License object, must be retrieved from Get-RDMLicense or created via New-RDMLicense.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[PSLicenseInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMLicense -detailed". For technical information, type "Get-Help Set-RDMLicense -full".

---

### Syntax
```PowerShell
Set-RDMLicense [[-AutoAssign]] [-License] <PSLicenseInfo> [<CommonParameters>]
```
