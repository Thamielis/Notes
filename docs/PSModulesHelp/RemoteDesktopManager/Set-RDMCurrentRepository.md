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
PS C:\> $repository = Get-RDMRepository -Name "MyRepo" ;Set-RDMCurrentRepository repository
Get the repository named MyRepo and set it as the current repository.
```

---

### Parameters
#### **ID**
Specifies the GUID of the data source to set as the current.
The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Repository**
Repository object, must be retrieved from Get-RDMRepository or created via New-RDMRepository.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[PSRepositoryInfo]`|false   |1       |false        |

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
Set-RDMCurrentRepository [-ID] <Guid> [<CommonParameters>]
```
```PowerShell
Set-RDMCurrentRepository [[-Repository] <PSRepositoryInfo>] [<CommonParameters>]
```
