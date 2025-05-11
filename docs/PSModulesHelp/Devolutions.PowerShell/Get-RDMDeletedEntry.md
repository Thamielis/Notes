Get-RDMDeletedEntry
-------------------

### Synopsis
Get deleted entries' history

---

### Description

Get deleted entries' history. For the data source supporting this functionality, every time an entry is deleted it is logged. This cmdlet will return the deleted entries from the log.
The cmdlet get all deleted entries of the current vault. An ID can be passed to obtain a specific entry.
The cmdlet cannot be executed in offline. The user must have the right to view the deleted entries to obtain the logs.

---

### Related Links
* [Remove-RDMDeletedEntry](Remove-RDMDeletedEntry)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $today = (Get-Date).Date;
        Get-RDMDeletedEntry | Where ModifiedDate -ge $today
View all entries deleted today
```
> EXAMPLE 2

```PowerShell
PS C:\> $deletedEntries = Get-RDMDeletedEntry | Where GroupName -eq 'a\group\name'
        Remove-RDMDeletedEntry -InputObject $deletedEntries
Delete all deleted entries whose groupName is 'a\group\name'.
```

---

### Parameters
#### **CaseSensitive**
Filtering by name will be case sensitive.

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

#### **ID**
Obtain the deleted history of a specific entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **LiteralName**
Filter the result with the name. No characters are interpreted as wildcards.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Name**
Filter the result with the name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

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

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]

---

### Notes
For more information, type "Get-Help Get-RDMDeletedEntry -detailed". For technical information, type "Get-Help Get-RDMDeletedEntry -full".

---

### Syntax
```PowerShell
Get-RDMDeletedEntry [-ID] <Guid> [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMDeletedEntry [-LiteralName] <String[]> [-CaseSensitive] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMDeletedEntry [[-Name] <String[]>] [-CaseSensitive] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
