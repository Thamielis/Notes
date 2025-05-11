Set-RDMEntry
------------

### Synopsis
Save the entry.

---

### Description

Save the entry. The entry must be obtained via the Get-RDMEntry cmdlet or via the New-RDMEntry cmdlet. In the system vault, the supported types are limited to Group, Contact, SessionTool, and VPN.
    This cmdlet cannot be used to move an entry to another vault. To do so, use the Move-RDMEntry cmdlet.
    The user must have the rights to add or edit the entry. In the system vault, the user must be an administator.

---

### Related Links
* [Get-RDMEntry](Get-RDMEntry)

* [New-RDMEntry](New-RDMEntry)

* [Remove-RDMEntry](Remove-RDMEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $folder = New-RDMEntry -Name 'New Folder' -Type 'Group';
        $folder.GroupDetails.UserName = 'MyUserName';
        $folder.GroupDetails.Domain = 'MyDomain';
        $folder = Set-RDMEntry -InputObject $folder -PassThru
Create a new entry without saving it and store it in $folder. Add some additionnal information in the GroupDetails. Save the entry in the current vault and store it in $folder.
```
> EXAMPLE 2

```PowerShell
PS C:\> $entries = Get-RDMEntry -Name Entry?;
    $entries | ForEach-Object { $_.Name = '[Deprecated]' + $_.Name };
    $entries | Set-RDMEntry -Reresh
Store all entries whose name is Entry followed by a character. Append '[Deprecated]' to their name and save the modifications. The switch Refresh is used to ensure subsequent commands are applied on the modified entries.
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
PSConnection[] object retrieved from Get-RDMEntry or created via New-RDMEntry.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **PassThru**
Return the all saved entries as a PSConnection[].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Refresh entries in the vault. All entries of type 'Group' automatically trigger a refresh to ensure they are available for other entries. For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

Entries to save obtained from Get-RDMEntry or New-RDMEntry

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Set-RDMEntry -detailed". For technical information, type "Get-Help Set-RDMEntry -full".

---

### Syntax
```PowerShell
Set-RDMEntry [-InputObject] <PSConnection[]> [-PassThru] [-Refresh] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
