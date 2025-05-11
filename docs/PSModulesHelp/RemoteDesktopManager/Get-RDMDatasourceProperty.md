Get-RDMDatasourceProperty
-------------------------

### Synopsis
Get the value of property given for a dataSource.

---

### Description

Protected values will always return null.

Non value types will always return ".ToString()".

---

### Parameters
#### **DataSource**
Specifies the datasource

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSDataSource]`|true    |1       |true (ByValue)|

#### **Property**
Property to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource

Data source object

System.String

Property name

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
For more information, type "Get-Help Get-RDMDatasourceProperty -detailed". For technical information, type "Get-Help Get-RDMDatasourceProperty -full".

---

### Syntax
```PowerShell
Get-RDMDatasourceProperty [-DataSource] <PSDataSource> [-Property] <String> [<CommonParameters>]
```
