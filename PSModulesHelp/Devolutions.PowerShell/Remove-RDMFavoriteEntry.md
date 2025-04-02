Remove-RDMFavoriteEntry
-----------------------

### Synopsis
Remove entries from the favorites

---

### Description

Remove entries from the favorites

---

### Related Links
* [Add-RDMFavoriteEntry](Add-RDMFavoriteEntry)

* [Get-RDMFavoriteEntry](Get-RDMFavoriteEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMFavoriteEntry -Name 'EntryA' | Remove-RDMFavoriteEntry
Remove the entry named 'EntryA' from the favorites
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
Entries to remove from the favorites

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |named   |true (ByValue)|

#### **PassThru**
Return the PSConnection objects

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

Entries to be removed from the favorites

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Remove-RDMFavoriteEntry -detailed". For technical information, type "Get-Help Remove-RDMFavoriteEntry -full".

---

### Syntax
```PowerShell
Remove-RDMFavoriteEntry -InputObject <PSConnection[]> [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
