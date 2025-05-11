Export-PowerQuery
-----------------

### Synopsis
Exports Power Queries' M-Code Formulae from an Excel PowerQuery Enabled Workbook to a specified folder.

---

### Description

This function exports Power Queries' M-Code Formulae from an Excel PowerQuery Enabled Workbook to a specified
destination source code folder. This allows for the M-Code to be version controlled and maintained in a
source code repository alongside the rest of the workbook's source code (VBA, XML, SQL, DAX, etc.).

The function is designed to be used in conjunction with the Import-PowerQueries function, which imports all of
the Power Queries' M-Code Formulae from the specified source code folder into the Excel PowerQuery Enabled Workbook.

---

### Examples
> EXAMPLE 1

```PowerShell
Export-PowerQuery -Path ".\MyWorkbook.xlsx" -ExportPath ".\Source\PowerQuery"
Successfully exported MyQuery to file C:\MyProject\Source\PowerQuery\MyQuery.pq
```
> EXAMPLE 2

```PowerShell
Export-PowerQuery -Path .\Test.xlsm -ExportPath .\Source\PQ -Extension .pqm -Force
Successfully exported MyQuery to file C:\MyProject\Source\PQ\MyQuery.pqm
```

---

### Parameters
#### **Path**
The path to the Excel PowerQuery Enabled Workbook.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ExportPath**
(Optional) The path to the folder where the Power Queries' M-Code Formulae will be exported to. If not specified,
`<ProjectRoot>/Source/PowerQuery/*` is used as the default source code export path for the queries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Extension**
(Optional) The file extension to use for the exported Power Queries' M-Code Formulae. If not specified, `.pq` is used
as the default file extension. Typically, `.pq` is used for Power Query M-Code files, but other extensions are also
common such as `.m`, `.pqm`, `.txt`, etc.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Force**
(Optional) If specified, the function will overwrite any existing files in the specified source code export path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Collections.ArrayList](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.ArrayList)

---

### Notes
During Development of Excel based applications, an essential component of developing and maintaining the
project's source code is continuous export/import and synchronization of source files with the
host application for portability and most of all, version control.

One area typically overlooked in this regard is the M-Code behind the Power Query components in the workbook's
data model. Whether it be a Dynamic Query, User Defined Function, Query Parameter, Lookup Table, or any other
Power Query component type (i.e. template, data source, properties, metadata, etc.), the M-Code behind
the scenes is the foundation that all queries are built from and what drives the core behaviour of the query's
component.

---

### Syntax
```PowerShell
Export-PowerQuery [-Path] <String> [[-ExportPath] <String>] [[-Extension] <String>] [-Force] [<CommonParameters>]
```
