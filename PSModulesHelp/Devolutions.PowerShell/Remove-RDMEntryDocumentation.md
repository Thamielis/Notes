Remove-RDMEntryDocumentation
----------------------------

### Synopsis
Delete documentation pages

---

### Description

Delete documentation pages. The documentation pages must be fetched by Get-RDMEntryDocumentation.
    The data source must support the documentation feature and be online. The user must have the rights to delete the documentation.

---

### Related Links
* [Get-RDMEntryDocumentation](Get-RDMEntryDocumentation)

* [New-RDMEntryDocumentation](New-RDMEntryDocumentation)

* [Set-RDMEntryDocumentation](Set-RDMEntryDocumentation)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry | Get-RDMEntryDocumentation -Name 'Subject A*' -CaseSensitive | Remove-RDMEntryDocumentation
Delete all documentation pages whose name starts with 'Subject A' in the current vault
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Data '*Temporary*' -CaseSensitive | Remove-RDMEntryDocumentation
Delete all documentation pages of the entry 'EntryA' that contains the word 'Temporary'
```

---

### Parameters
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

#### **InputObject**
Documentation pages to delete

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[PSHandbookPage[]]`|true    |1       |true (ByValue)|

#### **Refresh**
Refresh the entries in the vault. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage[]

Documentation pages, obtained from Get-RDMEntryDocumentation, to delete.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMEntryDocumentation -detailed". For technical information, type "Get-Help Remove-RDMEntryDocumentation -full".

---

### Syntax
```PowerShell
Remove-RDMEntryDocumentation [-InputObject] <PSHandbookPage[]> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
