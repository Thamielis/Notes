Import-RDMDataSource
--------------------

### Synopsis
Import RDM DataSource from a file

---

### Description

Import RDM DataSource from a file

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Import-RDMDataSource -Path "C:\MyFile.rdd" | Set-RDMDataSource
Import the data source from a configuration and save it
```
> EXAMPLE 2

```PowerShell
PS C:\> $ds = Import-RDMDataSource -Path "C:\MyFile.rdd"; $ds.Name = "ANewName"; Set-RDMDataSource -DataSource $ds
Import the data source from a configuration file, rename it "ANewName" and save it
```

---

### Parameters
#### **Path**
Path where the file is loaded. Must end with .rdd

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
For more information, type "Get-Help Import-RDMDataSource -detailed". For technical information, type "Get-Help Import-RDMDataSource -full".

---

### Syntax
```PowerShell
Import-RDMDataSource [-Path] <String> [<CommonParameters>]
```
