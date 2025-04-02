Remove-VBRRestoreSession
------------------------

### Synopsis
Removes restore sessions.

---

### Description

This cmdlet removes a selected restore session from Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VBRRestoreSession -Name "Fileserver 03" | Select -Last 1 | Remove-VBRRestoreSession
This command removes the last restore session of the VM named "Fileserver". The restore session is obtained with Get-VBRRestoreSession and piped down.
```
> Example 2

```PowerShell
Remove-VBRRestoreSession -Session $session
This command removes the restore session represented by the $session variable. The restore session object is obtained with Get-VBRRestoreSession and assigned to the variable beforehand.
```

---

### Parameters
#### **Session**
Specifies the restore session you want to remove.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CRestoreSession[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.Core.CRestoreSession[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRRestoreSession [-Session] <CRestoreSession[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
