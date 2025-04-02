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
Set-RDMRepository [-Repository] <PSRepositoryInfo> [<CommonParameters>]
```
