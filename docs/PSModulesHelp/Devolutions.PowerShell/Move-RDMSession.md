Move-RDMSession
---------------

### Synopsis
Move entries to the specified group or a new vault.

---

### Description

Move entries to the specified group. If an entry is a group, all the entries it contains will be also moved. To transfer to a new vault, its ID must used. If a transfered folder contains an non transfered entry, the folder will be copied instead of moved. Only an administrator can transfer entries between vaults. Its not possible to do so from or to the user vault.
            It is not allowed to move a parent group to one of its child group. It is not allowed to have a group with a duplicate name. In those two cases, the group will not be moved to the destination.
            To obtain the entries obtained from the user input that actually moved, use the PassThru parameter.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSession -Name FolderToBeMoved | Move-RDMSession -Destination ""
Move the group named FolderToBeMoved and all entries it contains to the root
```
> EXAMPLE 2

```PowerShell
PS C:\> Move-RDMSession -Name EntryA, EntryB, EntryE -Destination Greener\Pastures
Move the entries EntryA, EntryB, and EntryE to the group Pastures whose parent is the group Greener.
```
> EXAMPLE 3

```PowerShell
PS C:\> $vaultDestination = Get-RDMRepository -Name 'VaultA';
        Move-RDMSession -Name EntryA, EntryB, EntryE -ToVaultID $vaultDestination.ID
Move the entries EntryA, EntryB, and EntryE from the current vault to the vault named 'VaultA'.
```

---

### Parameters
#### **Destination**
New group value. It must be the complete path to the folder. It is corresponding to the Group attribute to the PSConnection object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

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

#### **ID**
Specifies the ID of the entries to be moved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |1       |false        |

#### **InputObject**
Specifies the entries to be moved.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

#### **Name**
Specifies the name of the entries to be moved.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **PassThru**
Return the entries with the new group. Entries in a moved group will not be returned unless they were passed to the command. All unmodified entries are not returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Refresh RDM UI. If RDM in not open, nothing happens.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToVaultID**
ID of the vault where the entries will be moved. Cannot transfer entries from the user vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |2       |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

Array of PSConnection to move.

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Move-RDMSession -detailed". For technical information, type "Get-Help Move-RDMSession -full".

---

### Syntax
```PowerShell
Move-RDMSession [-ID] <Guid[]> [-Destination] <String> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Move-RDMSession [-ID] <Guid[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Move-RDMSession [-InputObject] <PSConnection[]> [-Destination] <String> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Move-RDMSession [-InputObject] <PSConnection[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Move-RDMSession [-Name] <String[]> [-Destination] <String> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Move-RDMSession [-Name] <String[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
