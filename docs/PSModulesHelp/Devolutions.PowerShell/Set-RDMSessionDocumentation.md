Set-RDMSessionDocumentation
---------------------------

### Synopsis
Set the documentation on a session.

---

### Description

Must have the right to add and edit. Documentation must be first fetch via the Get-RDMSessionDocumentation cmdlet. If the documentation comes from another session, all pages will be created. Only before updating pages will the user be prompted to confirm.

---

### Related Links
* [Get-RDMRootSession](Get-RDMRootSession)

* [Get-RDMSession](Get-RDMSession)

* [Get-RDMSessionDocumentation](Get-RDMSessionDocumentation)

---

### Examples
> EXAMPLE 1

PS C:\> Get-RDMRootSession | Get-RDMSessionDocumentation | Set-RDMSessionDocumentation -Session (Get-RDMSession -Name "ASession")
Copy the documentation from the current data source's root to the session "ASession".
> EXAMPLE 2

PS C:\> $sess = Get-RDMSession -Name "ASession"; Get-RDMDataSource -Name "AnotherDataSource" | Set-RDMCurrentDataSource; Get-RDMRootSession | Get-RDMSessionDocumentation | Set-RDMSessionDocumentation -Session $sess)
Copy the documentation from the root session of "AnotherDataSource" to the session "ASession" of the previous data source.
> EXAMPLE 3

PS C:\> Set-RDMSessionDocumentation -Name ASession -DefaultPage NewDefaultPage -Force)
Change the default documentation page of the session ASession to NewDefaultPage.

---

### Parameters
#### **AsLastPage**
Append the created pages to the end.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DefaultPage**
Define a new default page in the documentation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Force**
Update the documentation without confirmation.

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
Specifies the documentation to set.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSHandbook]`|true    |2       |true (ByValue)|

#### **ID**
Current data source session`s ID where the documentation will be set.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Name**
Current data source session`s name where the documentation will be set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
Session where the documentation will be set.

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
For more information, type "Get-Help Set-RDMSessionDocumentation -detailed". For technical information, type "Get-Help Set-RDMSessionDocumentation -full".

---

### Syntax
```PowerShell
Set-RDMSessionDocumentation [-Handbook] <PSHandbook> [-AsLastPage] [-ID] <Guid> [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMSessionDocumentation [-Handbook] <PSHandbook> [-AsLastPage] [[-Name] <String>] [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMSessionDocumentation [-Handbook] <PSHandbook> [-AsLastPage] [-Session] <PSConnection> [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [-ID] <Guid> [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [[-Name] <String>] [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [-Session] <PSConnection> [-Refresh] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
