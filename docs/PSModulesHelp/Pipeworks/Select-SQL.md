Select-SQL
----------

### Synopsis
Select SQL data

---

### Description

Select data from a SQL databsae

---

### Related Links
* [Add-SqlTable](Add-SqlTable)

* [Update-SQL](Update-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
Select-Sql -FromTable ATable -Property Name, Day, Month, Year -Where "Year = 2005" -ConnectionSetting SqlAzureConnectionString
```
> EXAMPLE 2

```PowerShell
Select-Sql -FromTable INFORMATION_SCHEMA.TABLES -ConnectionSetting SqlAzureConnectionString -Property Table_Name -verbose
```
> EXAMPLE 3

```PowerShell
Select-Sql -FromTable INFORMATION_SCHEMA.TABLES -ConnectionSetting "Data Source=$env:ComputerName;Initial Catalog=Master;Integrated Security=SSPI;" -Property Table_Name -verbose
```
> EXAMPLE 4

```PowerShell
Select-Sql "
SELECT  sys.objects.name,
    SUM(row_count) AS 'Row Count',
    SUM(reserved_page_count) * 8.0 / 1024 AS 'Table Size (MB)'
FROM sys.dm_db_partition_stats, sys.objects
WHERE sys.dm_db_partition_stats.object_id = sys.objects.object_id
GROUP BY sys.objects.name
ORDER BY [Table Size (MB)] DESC
"
```

---

### Parameters
#### **Query**
The table containing SQL results

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|SQL    |

#### **SqlFile**
The path to a SQL file

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|Fullname|

#### **FromTable**
The table containing SQL results

|Type      |Required|Position|PipelineInput        |Aliases                     |
|----------|--------|--------|---------------------|----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Table<br/>From<br/>TableName|

#### **Distinct**
If set, will only return unique values.  This corresponds to the DISTINCT SQL qualifier.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Switch]`|false   |named   |true (ByPropertyName)|Unique |

#### **Property**
The properties to pull from SQL. If not set, all properties (*) will be returned

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Top**
The sort order of the returned objects

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[UInt32]`|false   |named   |true (ByPropertyName)|First  |

#### **OrderBy**
The sort order of the returned objects

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Sort   |

#### **Descending**
If set, sorted items will be returned in descending order.  By default, if items are sorted, they will be in ascending order.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Where**
The where clause.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
If set, will output the SQL

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
The path to SQLite.  If not provided, SQLite will be loaded from Program Files

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |SqlLitePath|

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

#### **DatabasePath**
The path to a SQL compact or SQL lite database

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |DBPath |

#### **AsA**
The way the data will be outputted.
Valid Values:

* Hashtable
* Datatable
* DataSet
* PSObject

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Dirty**
If set, the select statement will be run as a dirty read.  
In SQL Server, this will be With (nolock).  
In MYSql, this will change the session options for the transaction to enable a dirty read.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

* [Data.DataRow](https://learn.microsoft.com/en-us/dotnet/api/System.Data.DataRow)

---

### Syntax
```PowerShell
Select-SQL [-Query] <String> [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-UseMySql] [-MySqlPath <String>] [-DatabasePath <String>] [-AsA <String>] [-Dirty] [<CommonParameters>]
```
```PowerShell
Select-SQL -SqlFile <String> [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-UseMySql] [-MySqlPath <String>] [-DatabasePath <String>] [-AsA <String>] [-Dirty] [<CommonParameters>]
```
```PowerShell
Select-SQL [-FromTable] <String> [-Distinct] [-Property <String[]>] [-Top <UInt32>] [-OrderBy <String[]>] [-Descending] [-Where <String>] [-ConnectionStringOrSetting <String>] [-Server <String>] [-Database <String>] [-OutputSql] [-UseSQLCompact] [-SqlCompactPath <String>] [-UseSQLite] [-SqlitePath <String>] [-UseMySql] [-MySqlPath <String>] [-DatabasePath <String>] [-AsA <String>] [-Dirty] [<CommonParameters>]
```
