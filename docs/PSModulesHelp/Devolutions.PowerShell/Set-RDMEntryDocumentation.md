Set-RDMEntryDocumentation
-------------------------

### Synopsis
Save modified documentation pages

---

### Description

Save modified documentation pages. The documentation pages must be fetched by Get-RDMEntryDocumentation. The associated entry must already exists.
    The data source must support the documentation feature and be online. The user must have the rights to edit the documentation.

---

### Related Links
* [Get-RDMEntryDocumentation](Get-RDMEntryDocumentation)

* [New-RDMEntryDocumentation](New-RDMEntryDocumentation)

* [Remove-RDMEntryDocumentation](Remove-RDMEntryDocumentation)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $defaultPages = Get-RDMEntry -VaultMode Global | Get-RDMEntryDocumentation -Default;
    foreach ($defaultPage in $defaultPages) { $defaultPage.Default = $false }
    Set-RDMEntryDocumentation -InputObject $defaultPages
Remove the default status of the default documentation page of each entries in the system vault.
```
> EXAMPLE 2

PS C:\> $page = Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Name PageA;
    $page.Name = 'My New Default Page';
    $page.Default = $true;
    Set-RDMEntryDocumentation -InputObject $page
Define the documentation page 'PageA' as the new dafault page and rename it to 'My New Default Page'

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
The documentation pages to update

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

Documentation pages, obtained from Get-RDMEntryDocumentation, to update.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMEntryDocumentation -detailed". For technical information, type "Get-Help Set-RDMEntryDocumentation -full".

---

### Syntax
```PowerShell
Set-RDMEntryDocumentation [-InputObject] <PSHandbookPage[]> [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
