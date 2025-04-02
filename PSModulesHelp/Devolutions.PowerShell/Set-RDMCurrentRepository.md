Set-RDMCurrentRepository
------------------------

### Synopsis
Set the current repository.

---

### Description

Set the current repository. Repository must be first fetch via repository property of the Get-RDMRepository cmdlet or via the New-RDMRepository result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $repository = Get-RDMRepository -Name "MyRepo" ;Set-RDMCurrentRepository $repository
Get the repository named MyRepo and set it as the current repository.
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

#### **ID**
Specifies the GUID of the data source to set as the current.
The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Repository**
Repository object, must be retrieved from Get-RDMRepository or created via New-RDMRepository.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[PSRepositoryInfo]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMCurrentRepository -detailed". For technical information, type "Get-Help Set-RDMCurrentRepository -full".

---

### Syntax
```PowerShell
Set-RDMCurrentRepository [-ID] <Guid> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMCurrentRepository [-Repository] <PSRepositoryInfo> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
