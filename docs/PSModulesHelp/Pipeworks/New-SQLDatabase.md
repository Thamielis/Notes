New-SQLDatabase
---------------

### Synopsis
Creates a new SQL database

---

### Description

Creates a database in SQL server, SQL azure, SQLCompact, or Sqlite

---

### Related Links
* [Select-SQL](Select-SQL)

* [Update-SQL](Update-SQL)

---

### Examples
> EXAMPLE 1

```PowerShell
New-SqlDatabase "Test DB"
```
> EXAMPLE 2

```PowerShell
New-SqlDatabase "Test DB" -ComputerName TheSqlServer
```

---

### Parameters
#### **DatabaseName**
The name of the new database

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ComputerName**
The name of the SQL server.  By default, the local machine

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|CN     |

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

#### **DatabaseLogFolder**
The log folder for the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabaseDataFolder**
The log folder for the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InitialDatabaseSize**
The initial size of the database.  By default, 10mb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **MaximumDatabaseSize**
The maximum size of the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **InitialLogSize**
The initial size of  the database logs.  By default, this is 1mb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **LogFileGrowth**
The size at which the log files will grow.  By default, this is 1mb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **DatabaseGrowth**
The size at which the database will grow.  By default, this is 5mb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **MaximumLogSize**
The maximum log size

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **NoStat**
If set, will not generate any core SQL server statistical information

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |NoStats|

#### **KeepTransactionLog**
If set, will keep a log of all transactions to the database

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OutputSQL**
If set, will output the SQL, but will not run the command

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseSqlite**
If set, will create a SQLite database

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|true    |named   |false        |UseSqlLite|

#### **SqlitePath**
The path to SQLite. If not set, will import SQLite from program files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseSqlCompact**
If set, will use SQL compact

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **SqlCompactPath**
The path the SQL compact.  If not provided, SQL compact will be loaded from the GAC.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DatabasePath**
The path to the database file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ConnectionStringOrSetting**
A connection string or a setting containing a connection string.

|Type      |Required|Position|PipelineInput|Aliases                               |
|----------|--------|--------|-------------|--------------------------------------|
|`[String]`|false   |named   |false        |ConnectionString<br/>ConnectionSetting|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
New-SQLDatabase -DatabaseName <String> [-ComputerName <String>] [-DatabaseLogFolder <String>] [-DatabaseDataFolder <String>] [-InitialDatabaseSize <UInt32>] [-MaximumDatabaseSize <UInt32>] [-InitialLogSize <UInt32>] [-LogFileGrowth <UInt32>] [-DatabaseGrowth <UInt32>] [-MaximumLogSize <UInt32>] [-NoStat] [-KeepTransactionLog] [-OutputSQL] [-ConnectionStringOrSetting <String>] [<CommonParameters>]
```
```PowerShell
New-SQLDatabase -DatabaseName <String> -UseMySql [-MySqlPath <String>] [-ConnectionStringOrSetting <String>] [<CommonParameters>]
```
```PowerShell
New-SQLDatabase -UseSqlite [-SqlitePath <String>] -DatabasePath <String> [-ConnectionStringOrSetting <String>] [<CommonParameters>]
```
```PowerShell
New-SQLDatabase -UseSqlCompact [-SqlCompactPath <String>] -DatabasePath <String> [-ConnectionStringOrSetting <String>] [<CommonParameters>]
```
