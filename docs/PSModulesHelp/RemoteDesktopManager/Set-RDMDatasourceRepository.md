Set-RDMDatasourceRepository
---------------------------

### Synopsis
Modify data source repository

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $dataSource = Get-RDMDataSource -Name MyDataSource; $repository = Get-RDMRepository -Name MyRepository ;Set-RDMDatasourceRepository -DataSource $dataSource -Repository $repository
Modifiy the data source repository to
```

---

### Parameters
#### **DataSource**
Specifies the data source to change the current repository

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|true    |1       |true (ByValue)|

#### **Repository**
New data source current repository.

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[PSRepositoryInfo]`|true    |2       |false        |Vault  |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDatasourceRepository -detailed". For technical information, type "Get-Help Set-RDMDatasourceRepository -full".

---

### Syntax
```PowerShell
Set-RDMDatasourceRepository [-DataSource] <PSDataSource> [-Repository] <PSRepositoryInfo> [<CommonParameters>]
```
