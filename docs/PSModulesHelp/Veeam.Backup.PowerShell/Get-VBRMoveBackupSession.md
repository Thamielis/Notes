Get-VBRMoveBackupSession
------------------------

### Synopsis
Returns move sessions.

---

### Description

This cmdlet returns move sessions.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Getting Move Sessions for Specific Backup

$backup = Get-VBRBackup -Name "vCloud Webservices Backup"
Get-VBRMoveBackupSession -Backup $backup
This example shows how to look for move sessions for the vCloud Webservices Backup backup job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Provide the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRMoveBackupSession cmdlet. Set the $backup variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies the backup for which you want to get move sessions.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VBRBackup]`|true    |named   |False        |

#### **Id**
Specifies the ID of the session. The cmdlet will return the session with this ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **MachineName**
Specifies the name of the machine for which you want to return the move sessions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRMoveBackupSession -Backup <VBRBackup> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Get-VBRMoveBackupSession -Id <Guid> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Get-VBRMoveBackupSession -MachineName <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
