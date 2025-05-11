Read-OleDbData
--------------

### Synopsis
Read data from an OleDb source using dotnet classes. This allows for OleDb queries against excel spreadsheets. Examples will only be for querying xlsx files.

For additional documentation, see Microsoft's documentation on the System.Data OleDb namespace here:
https://docs.microsoft.com/en-us/dotnet/api/system.data.oledb

---

### Description

Read data from an OleDb source using dotnet classes. This allows for OleDb queries against excel spreadsheets. Examples will only be for querying xlsx files using ACE.

---

### Examples
> EXAMPLE 1

```PowerShell
Read-OleDbData `
    -ConnectionString "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=file.xlsx;Extended Properties='Excel 12.0 Xml;HDR=NO;IMEX=1;'" `
    -SqlStatement "select ROUND(F1) as [A] from [sheet1$A1:A1]"
```
> EXAMPLE 2

```PowerShell
$ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=file.xlsx;Extended Properties='Excel 12.0 Xml;HDR=NO;IMEX=1;'"
$SqlStatement = "select ROUND(F1) as [A] from [sheet1$A1:A1]"
Read-OleDbData -ConnectionString $ConnectionString -SqlStatement $SqlStatement
```
> EXAMPLE 3

```PowerShell
$ReadDataArgs = @{
    SqlStatement = Get-Content query.sql -Raw
    ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=file.xlsx;Extended Properties='Excel 12.0 Xml;HDR=NO;IMEX=1;'"
}
$Results = Read-OleDbData @ReadDataArgs
```

---

### Parameters
#### **ConnectionString**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SqlStatement**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Read-OleDbData [-ConnectionString] <String> [-SqlStatement] <String> [<CommonParameters>]
```
