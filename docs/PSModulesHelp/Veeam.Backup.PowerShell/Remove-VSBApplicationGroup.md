Remove-VSBApplicationGroup
--------------------------

### Synopsis
Removes a specified application group from Veeam Backup & Replication.

---

### Description

This cmdlet removes a specified application group from Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VSBApplicationGroup -Name "AppGroup 01", "AppGroup 02"| Remove-VSBApplicationGroup
This command removes the application groups named "AppGroup 01" and "AppGroup 02". The application groups are obtained with Get-VSBApplicationGroup and piped down.
```
> Example 2

```PowerShell
Remove-VSBApplicationGroup -AppGroup $appgroup
This command removes the application group represented by the $appgroup variable. The application group is obtained with Get-VSBApplicationGroup and assigned to the variable beforehand.
```

---

### Parameters
#### **AppGroup**
Specifies the application group you want to remove. You can assign multiple application groups to this object.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CSbAppGroup[]]`|false   |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.SureBackup.CSbAppGroup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VSBApplicationGroup [[-AppGroup] <CSbAppGroup[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
