Remove-RDMFavoriteFolder
------------------------

### Synopsis
Remove a favorite folder

---

### Description

Remove a favorite folder. If it contains entries, the user will be prompted to see if the favorite entries will be moved to the parent folder or deleted.

---

### Related Links
* [New-RDMFavoriteFolder](New-RDMFavoriteFolder)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Remove-RDMFavoriteFolder -Name 'FolderA\SubFolderA'
Remove the favorite folder named 'SubFolderA'
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

#### **Name**
Name of the favorite folder to delete.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMFavoriteFolder -detailed". For technical information, type "Get-Help Remove-RDMFavoriteFolder -full".

---

### Syntax
```PowerShell
Remove-RDMFavoriteFolder [-Name] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
