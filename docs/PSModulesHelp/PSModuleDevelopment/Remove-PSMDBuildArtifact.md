Remove-PSMDBuildArtifact
------------------------

### Synopsis
Removes an artifact from the build pipeline.

---

### Description

Removes an artifact from the build pipeline.
Only interacts with the PSModuleDevelopment build system.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-PSMDBuildArtifact -Name 'session'
Removes the artifact 'session' from the build pipeline.
```
> EXAMPLE 2

```PowerShell
Get-PSMDBuildArtifact -Tag pssession | Remove-PSMDBuildArtifact
Removes all artifacts with the 'pssession' tag from the build pipeline.
```

---

### Parameters
#### **Name**
Name of the artifact to remove.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Syntax
```PowerShell
Remove-PSMDBuildArtifact [-Name] <String[]> [<CommonParameters>]
```
