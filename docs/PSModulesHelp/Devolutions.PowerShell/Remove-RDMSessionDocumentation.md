Remove-RDMSessionDocumentation
------------------------------

### Synopsis
Remove the documentation of a session.

---

### Description

Must have the right to delete. Three possiblities exist to remove the documentation of a session.The All switch is used to remove all documentation. The Handbook parameter uses documentation fetched via the Get-RDMDocumentation cmdlet. The Name parameter allows to delete all pages named the value entered. The user will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMRootSession](Get-RDMRootSession)

* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionDocumentation](Get-RDMSessionDocumentation)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMRootSession | Remove-RDMSessionDocumentation -All
Remove all documentation in the root session of the current data source. The user will be prompted.
```
> EXAMPLE 2

```PowerShell
PS C:\> Remove-RDMSessionDocumentation -Name "ASession" -Page "APage" -Force
Remove documentation page "APage" from the session "ASession" without prompting the user.
```
> EXAMPLE 3

```PowerShell
PS C:\ $id = [Guid]"00000000-0000-0000-0000-000000000000"; $doc = Get-RDMSessionDocumentation -ID $id; $doc.Pages = ($doc.Pages | Where-Object { $_.Default -ne $true }); Remove-RDMSessionDocumentation -ID $id -Handbook $doc -Refresh
Remove all documentation pages except the default one from the session with ID = 00000000-0000-0000-0000-000000000000 of the current data source. The user will be prompted before deleting a page.
```

---

### Parameters
#### **All**
Delete all existing documentation of the session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Force**
Delete the documentation without confirmation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **Handbook**
Specifies the documentation to delete.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSHandbook]`|true    |2       |true (ByValue)|

#### **ID**
Current data source session`s ID from which to delete the documentation.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Name**
Current data source session`s name from which to extract the documentation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Page**
Specifies the documentation page to delete.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |2       |true (ByValue)|

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
Session where the documentation will be deleted.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

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
For more information, type "Get-Help Remove-RDMSessionDocumentation -detailed". For technical information, type "Get-Help Remove-RDMSessionDocumentation -full".

---

### Syntax
```PowerShell
Remove-RDMSessionDocumentation -All [-ID] <Guid> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation -All [[-Name] <String>] [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation -All [-Session] <PSConnection> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Handbook] <PSHandbook> [-ID] <Guid> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Handbook] <PSHandbook> [[-Name] <String>] [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Handbook] <PSHandbook> [-Session] <PSConnection> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-ID] <Guid> [-Page] <String> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [[-Name] <String>] [-Page] <String> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Page] <String> [-Session] <PSConnection> [-Force] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
