Remove-SQL
----------

### Synopsis
Removes SQL data

---

### Description

Removes SQL data or databases

---

### Related Links
* [Add-SqlTable](Add-SqlTable)

* [Update-SQL](Update-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-Sql -TableName ATable -ConnectionSetting SqlAzureConnectionString
```
> EXAMPLE 2

```PowerShell
Remove-Sql -TableName ATable -Where 'RowKey = 1' -ConnectionSetting SqlAzureConnectionString
```
> EXAMPLE 3

```PowerShell
Remove-Sql -TableName ATable -Clear -ConnectionSetting SqlAzureConnectionString
```

---

### Parameters
#### **TableName**
The table containing SQL results

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Table<br/>From<br/>Table_Name|

#### **Where**
The where clause.  Beware:  different SQL engines treat this differently.  For instance, SQL server Compact requires the format:
([RowName] = 'Value')

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **WhereIn**
The set of specific rows to be deleted

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **PropertyName**
The name of the properties

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Clear**
If set, will clear the table's contents, but will not remove the table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |2       |true (ByPropertyName)|

#### **ConnectionStringOrSetting**
A connection string or setting.

|Type      |Required|Position|PipelineInput|Aliases                               |
|----------|--------|--------|-------------|--------------------------------------|
|`[String]`|false   |named   |false        |ConnectionString<br/>ConnectionSetting|

#### **Server**
The name of the SQL server.  This is used with a database name to craft a connection string to SQL server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Database**
The database on a SQL server.  This is used with the server name to craft a connection string to SQL server

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutputSql**
If set, will output the SQL, instead of executing the remove.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseSQLCompact**
If set, will use SQL server compact edition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SqlCompactPath**
The path to SQL Compact.  If not provided, SQL compact will be loaded from the GAC

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseSQLite**
If set, will use SQL lite

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |UseSqlLite|

#### **SqlitePath**
The path to SQL Lite.  If not provided, SQL compact will be loaded from Program Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabasePath**
The path to a SQL compact or SQL lite database

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |DBPath |

#### **UseMySql**
If set, will use MySql to connect to the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MySqlPath**
The path to MySql's .NET connector.  If not provided, MySql will be loaded from Program Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Remove-SQL [-TableName] <String> [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-DatabasePath <String>] [-UseMySql] [-MySqlPath <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-SQL [-TableName] <String> [-Where] <String> [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-DatabasePath <String>] [-UseMySql] [-MySqlPath <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-SQL [-TableName] <String> [-WhereIn] <String[]> [-PropertyName] <String> [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-DatabasePath <String>] [-UseMySql] [-MySqlPath <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-SQL [-TableName] <String> [-Clear] [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-DatabasePath <String>] [-UseMySql] [-MySqlPath <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
