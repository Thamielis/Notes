Update-Sql
----------

### Synopsis
Updates a SQL table

---

### Description

Inserts new content into a SQL table, or updates the existing contents of a SQL table

---

### Related Links
* [Select-Sql](Select-Sql)

* [Remove-Sql](Remove-Sql)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Counter | 
    Select-Object -ExpandProperty CounterSamples  | 
    Update-Sql -TableName Perfcounters -Force -ConnectionStringOrSetting (Get-SecureSetting SqlAzureConnectionString -ValueOnly)
```
> EXAMPLE 2

```PowerShell
Get-Counter | 
    Select-Object -ExpandProperty CounterSamples  | 
    Update-Sql -TableName Perfcounters -Force -ConnectionStringOrSetting (Get-SecureSetting SqlAzureConnectionString -ValueOnly) -Parallel
```

---

### Parameters
#### **TableName**
The name of the SQL table

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **InputObject**
The Input Object

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |2       |true (ByValue)|

#### **Property**
A List of Properties to add to the database.  If omitted, all properties will be added (except those excluded with -ExcludeProperty)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **ExcludeProperty**
A List of Properties to exclude from the database.  If omitted, all properties (or the properties specified with the -Property parameter) will be added

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **RowKey**
The rowkey of the input object

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **RowProperty**
The property of the input object to use as a row

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **KeyType**
The type of key to use for the SQL table.
Valid Values:

* Guid
* Hex
* SmallHex
* Sequential
* Named
* Parameter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ColumnType**
A lookup table containing SQL data types

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |8       |false        |

#### **ColumnAlias**
A lookup table containing the real SQL column names for an object

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |9       |false        |

#### **Force**
If set, will force the creation of a table.
If omitted, an error will be thrown if the table does not exist.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ConnectionStringOrSetting**
The connection string or a setting containing the connection string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **OutputSql**
If set, will output SQL.  Be aware that this will only output insert statements, not update statements

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
|`[String]`|false   |11      |false        |

#### **UseSQLite**
If set, will use SQL lite

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |UseSqlLite|

#### **SqlitePath**
The path to SQLite.  If not provided, SQLite will be loaded from Program Files

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |12      |false        |SqlLitePath|

#### **UseMySql**
If set, will use MySql to connect to the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MySqlPath**
The path to MySql's .NET connector.  If not provided, MySql will be loaded from Program Files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **DatabasePath**
The path to a SQL compact or SQL lite database

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |14      |false        |DBPath |

#### **DoNotCheckTable**
If set, will skip table creation column checks

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **KeepConnected**
If set, will keep the connection open.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForeignKey**
Foreign keys in the table.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |15      |false        |

#### **StringKeyLength**
The length of a string key.  By default, 100

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |16      |false        |

#### **Parallel**
If set, will run Update-SQL in parallel

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideProgress**
If set, will hide the progress

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Passthru**
If set, will output the original object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Update-Sql [-TableName] <String> [-InputObject] <PSObject> [[-Property] <String[]>] [[-ExcludeProperty] <String[]>] [[-RowKey] <String>] [[-RowProperty] <String>] [[-KeyType] <String>] [[-ColumnType] <Hashtable[]>] [[-ColumnAlias] <Hashtable[]>] [-Force] [[-ConnectionStringOrSetting] <String>] [-OutputSql] [-UseSQLCompact] [[-SqlCompactPath] <String>] [-UseSQLite] [[-SqlitePath] <String>] [-UseMySql] [[-MySqlPath] <String>] [[-DatabasePath] <String>] [-DoNotCheckTable] [-KeepConnected] [[-ForeignKey] <Hashtable>] [[-StringKeyLength] <UInt32>] [-Parallel] [-HideProgress] [-Passthru] [<CommonParameters>]
```
