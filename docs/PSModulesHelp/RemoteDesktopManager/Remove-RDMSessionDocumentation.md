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
|`[Switch]`|true    |1       |false        |

#### **Force**
Delete the documentation without confirmation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

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
|`[Switch]`|false   |1       |false        |

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
Remove-RDMSessionDocumentation [-ID] <Guid> [-All] [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-All] [[-Name] <String>] [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Session] <PSConnection> [-All] [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-ID] <Guid> [-Handbook] <PSHandbook> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Handbook] <PSHandbook> [[-Name] <String>] [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Session] <PSConnection> [-Handbook] <PSHandbook> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-ID] <Guid> [-Page] <String> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [[-Name] <String>] [-Page] <String> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMSessionDocumentation [-Session] <PSConnection> [-Page] <String> [[-Force]] [[-Refresh]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
