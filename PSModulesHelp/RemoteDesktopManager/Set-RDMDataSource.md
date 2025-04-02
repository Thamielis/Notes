Set-RDMDataSource
-----------------

### Synopsis
Save/set the datasource.

---

### Description

Save/set the datasource. Datasource must be first fetch via Data source property of the Get-RDMDataSource cmdlet or via the New-RDMDataSource result.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMDataSource;  Set-RDMDataSourceProperty -DataSource $list[0] -Property "Name" -Value "MyNewDataSourceName"; Set-RDMDataSource $list[0]
Change the name of the first data source
```

---

### Parameters
#### **DataSource**
Specifies the data source to set/save.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMDataSource -detailed". For technical information, type "Get-Help Set-RDMDataSource -full".

---

### Syntax
```PowerShell
Set-RDMDataSource [-DataSource] <PSDataSource> [<CommonParameters>]
```
