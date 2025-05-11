Add-SqlTable
------------

### Synopsis
Adds a SQL Table

---

### Description

Creates a new Table in SQL

---

### Related Links
* [Select-SQL](Select-SQL)

* [Update-SQL](Update-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-SqlTable -TableName PatchyComputers -KeyType Sequential -Column MachineName, GroupName, PatchStatus, PatchWindowStart, PatchStartedAt, LastPatchedAt -DataType 'varchar(100)', 'varchar(100)', 'varchar(20)', 'datetime', 'datetime', 'datetime' -OutputSql -ConnectionStringOrSetting SqlAzureConnectionString
```

---

### Parameters
#### **TableName**
The name of the SQL table

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Column**
The columns to create within the table

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **KeyType**
The keytype to use
Valid Values:

* Guid
* Hex
* SmallHex
* Sequential
* Named
* Parameter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RowKey**
The name of the column to use as a key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DataType**
The data types of each column

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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

#### **ForeignKey**
Foreign keys in the table.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **StringKeyLength**
The size of a string key.  By default, 100 characters

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Add-SqlTable -TableName <String> -Column <String[]> [-KeyType <String>] [-RowKey <String>] [-DataType <String[]>] [-ConnectionStringOrSetting <String>] [-OutputSQL] [-ForeignKey <Hashtable>] [-StringKeyLength <UInt32>] [<CommonParameters>]
```
```PowerShell
Add-SqlTable -TableName <String> -Column <String[]> [-KeyType <String>] [-RowKey <String>] [-DataType <String[]>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseSQLCompact [-SqlCompactPath <String>] -DatabasePath <String> [-StringKeyLength <UInt32>] [<CommonParameters>]
```
```PowerShell
Add-SqlTable -TableName <String> -Column <String[]> [-KeyType <String>] [-RowKey <String>] [-DataType <String[]>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseMySql [-MySqlPath <String>] [-StringKeyLength <UInt32>] [<CommonParameters>]
```
```PowerShell
Add-SqlTable -TableName <String> -Column <String[]> [-KeyType <String>] [-RowKey <String>] [-DataType <String[]>] [-ConnectionStringOrSetting <String>] [-OutputSQL] -UseSQLite [-SqlitePath <String>] -DatabasePath <String> [-StringKeyLength <UInt32>] [<CommonParameters>]
```
