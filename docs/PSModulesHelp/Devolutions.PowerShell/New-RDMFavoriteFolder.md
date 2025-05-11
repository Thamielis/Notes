New-RDMFavoriteFolder
---------------------

### Synopsis
Create a favorite folder

---

### Description

Create a favorite folder. It can be used to organize the favorite entries.

---

### Related Links
* [Remove-RDMFavoriteEntry](Remove-RDMFavoriteEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-RDMFavoriteFolder -Name 'FolderA\SubFolderA'
Create a new favorite folder named 'SubFolderA' inside the existing favorite folder named 'FolderA'.
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
Name of the favorite folder to create. It cannot contain a character that is not allowed in a filename or path name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMFavoriteFolder -detailed". For technical information, type "Get-Help New-RDMFavoriteFolder -full".

---

### Syntax
```PowerShell
New-RDMFavoriteFolder [-Name] <String> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
