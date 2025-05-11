Remove-RDMPrivateSession
------------------------

### Synopsis
Delete an existing session.

---

### Description

You will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Get-RDMSession](Get-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMUserVaultSession; Remove-RDMUserVaultSession $list[1].ID
Retrieves the list of available sessions, deletes session at index 1.
```
> EXAMPLE 2

```PowerShell
PS C:\> Remove-RDMUserVaultSession "{00000000-0000-0000-0000-000000000000}"
Delete session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> Remove-RDMUserVaultSession -ID "{00000000-0000-0000-0000-000000000000}" -Force
Force delete of the session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 4

```PowerShell
PS C:\> $sessions = Get-RDMUserVaultSession -Name 'My Session'; Remove-RDMUserVaultSession -Session $session -Force
Force delete of the session MySession
```

---

### Parameters
#### **Force**
Forces removal of the session without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **ID**
Specifies the ID of the session to be deleted.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **Session**
Specifies the sessions to remove

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

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
* None

---

### Notes
For more information, type "Get-Help Remove-RDMPrivateSession -detailed". For technical information, type "Get-Help Remove-RDMPrivateSession -full".

---

### Syntax
```PowerShell
Remove-RDMPrivateSession [-ID] <Guid> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMPrivateSession [-Session] <PSConnection[]> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
