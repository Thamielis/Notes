Get-SQLTable
------------

### Synopsis
Gets SQL table information

---

### Description

Gets metadata about a SQL table, including it's columns and their data types

---

### Related Links
* [Add-SqlTable](Add-SqlTable)

* [Update-SQL](Update-SQL)

* [Remove-SQL](Remove-SQL)

* [Select-SQL](Select-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SqlTable "MySqlTable" -ConnectionString SqlAzureConnectionString
```

---

### Parameters
#### **TableName**
The name of the SQL table

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **ConnectionStringOrSetting**
A connection string or a setting containing a connection string.

|Type      |Required|Position|PipelineInput|Aliases                               |
|----------|--------|--------|-------------|--------------------------------------|
|`[String]`|false   |named   |false        |ConnectionString<br/>ConnectionSetting|

#### **OutputSQL**
If set, outputs the SQL, and doesn't execute it

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseSQLCompact**
If set, will use SQL server compact edition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **SqlCompactPath**
The path to SQL Compact.  If not provided, SQL compact will be loaded from the GAC

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseSQLite**
If set, will use SQL lite

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|true    |named   |false        |UseSqlLite|

#### **SqlitePath**
The path to SQL Lite.  If not provided, SQL compact will be loaded from Program Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabasePath**
The path to a SQL compact or SQL lite database

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |DBPath |

#### **UseMySql**
If set, will use MySql to connect to the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **MySqlPath**
The path to MySql's .NET connector.  If not provided, MySql will be loaded from Program Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-SQLTable [[-TableName] <String>] [-ConnectionStringOrSetting <String>] [-OutputSQL] [<CommonParameters>]
```
```PowerShell
Get-SQLTable [[-TableName] <String>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseSQLCompact [-SqlCompactPath <String>] -DatabasePath <String> [<CommonParameters>]
```
```PowerShell
Get-SQLTable [[-TableName] <String>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseSQLite [-SqlitePath <String>] -DatabasePath <String> [<CommonParameters>]
```
```PowerShell
Get-SQLTable [[-TableName] <String>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseMySql [-MySqlPath <String>] [<CommonParameters>]
```
