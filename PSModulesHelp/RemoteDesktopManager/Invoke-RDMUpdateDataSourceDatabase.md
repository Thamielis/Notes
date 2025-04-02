Invoke-RDMUpdateDataSourceDatabase
----------------------------------

### Synopsis
Upgrade a Database

---

### Description

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $ds = Get-RDMDataSource -Name SQLServerDataSourceName; Invoke-RDMUpdateDataSourceDatabase -DataSource $ds
Get a SQL Server data source and upgrade the database
```

---

### Parameters
#### **DataSource**
PSDataSource object, must be retrieved from Get-RDMDataSource.

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
For more information, type "Get-Help Invoke-RDMUpdateDataSourceDatabase -detailed". For technical information, type "Get-Help Invoke-RDMUpdateDataSourceDatabase -full".

---

### Syntax
```PowerShell
Invoke-RDMUpdateDataSourceDatabase [-DataSource] <PSDataSource> [<CommonParameters>]
```
