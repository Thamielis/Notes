Add-RDMFavoriteEntry
--------------------

### Synopsis
Add entries to the favorites

---

### Description

Add entries to the favorites. Entries from the System Vault, as well as subentries, are prohibited from being added to the favorites.

---

### Related Links
* [Get-RDMFavoriteEntry](Get-RDMFavoriteEntry)

* [Remove-RDMFavoriteEntry](Remove-RDMFavoriteEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-RDMEntry -Name 'Entry A' | Add-RDMFavoriteEntry -FolderName 'FolderA\SubFolderA'
Add the entry named 'Entry A' to the favorite folder named 'FolderA\SubFolderA'.
```

---

### Parameters
#### **FolderName**
Favorite folder where the entries will be added. If not specified, it will be at the root.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Entries to add to the favorites

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

Entries to be added to the favorites

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]

---

### Notes
For more information, type "Get-Help Add-RDMFavoriteEntry -detailed". For technical information, type "Get-Help Add-RDMFavoriteEntry -full".

---

### Syntax
```PowerShell
Add-RDMFavoriteEntry -InputObject <PSConnection[]> [-FolderName <String>] [-PassThru] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
