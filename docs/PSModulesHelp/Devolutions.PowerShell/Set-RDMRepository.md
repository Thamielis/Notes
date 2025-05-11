Set-RDMRepository
-----------------

### Synopsis
Save/set the repository.

---

### Description

Save/set the repository. Repository must be first fetch via repository property of the Get-RDMRepository cmdlet or via the New-RDMRepository result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $repository = New-RDMRepository -Name "New Repository" ;Set-RDMRepository repository
Create & save new repository.
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

#### **Repository**
repository object, must be retrieved from Get-RDMRepository or created via New-RDMRepository.

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[PSRepositoryInfo]`|true    |1       |false        |Vault  |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMRepository -detailed". For technical information, type "Get-Help Set-RDMRepository -full".

---

### Syntax
```PowerShell
Set-RDMRepository [-Repository] <PSRepositoryInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
