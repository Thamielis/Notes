Invoke-ExcelQuery
-----------------

### Synopsis
Helper method for executing Read-OleDbData with some basic defaults.

For additional help, see documentation for Read-OleDbData cmdlet.

---

### Description

Uses Read-OleDbData to execute a sql statement against a xlsx file. For finer grained control over the interaction, you may use that cmdlet. This cmdlet assumes a file path will be passed in and the connection string will be built with no headers and treating all results as text.

Running this command is equivalent to running the following:

$FullName = (Get-ChildItem $Path).FullName
Read-OleDbData `
    -ConnectionString "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$FullName;Extended Properties='Excel 12.0 Xml;HDR=NO;IMEX=1;'" `
    -SqlStatement $Query

Note that this command uses the MICROSOFT.ACE.OLEDB provider and will not work without it.

If needed, please download the appropriate package from https://www.microsoft.com/en-us/download/details.aspx?id=54920.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-ExcelQuery .\test.xlsx 'select ROUND(F1) as [A1] from [sheet3$A1:A1]'
```
> EXAMPLE 2

```PowerShell
$Path = (Get-ChildItem 'test.xlsx').FullName
$Query = "select ROUND(F1) as [A] from [sheet1$A1:A1]"
Read-XlsxUsingOleDb -Path $Path -Query $Query
```
> EXAMPLE 3

```PowerShell
$ReadDataArgs = @{
    Path = .\test.xlsx
    Query = Get-Content query.sql -Raw
}
$Results = Invoke-ExcelQuery @ReadDataArgs
```

---

### Parameters
#### **Path**
The path to the file to open.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Query**
var name consistent with Import-Excel
var name consistent with Invoke-Sqlcmd

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Invoke-ExcelQuery [-Path] <String> [-Query] <String> [<CommonParameters>]
```
