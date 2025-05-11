Import-StoredProcedure
----------------------

### Synopsis
Imports a Stored Procedure as a PowerShell function

---

### Description

Imports SQL Stored Procedure as a PowerShell functions

---

### Related Links
* [Select-SQL](Select-SQL)

---

### Examples
Generates functions for all stored procedures in SQLAzure who have a name like *WmiSpy*

```PowerShell
Import-StoredProcedure -Name "*WmiSpy*" -ConnectionStringOrSetting SQLAzureConnectionString -EmbedConnectionString
```

---

### Parameters
#### **Name**
The names of specific stored procedures

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **ConnectionStringOrSetting**
A connection string or setting.

|Type      |Required|Position|PipelineInput|Aliases                               |
|----------|--------|--------|-------------|--------------------------------------|
|`[String]`|false   |named   |false        |ConnectionString<br/>ConnectionSetting|

#### **EmbedConnectionString**
If set, the connection string will be embedded in the generated functions.  As long as you're using integrated security, this is perfectly safe.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
At present, only stored procedures on SQL Server or in SQL Azure are supported.

---

### Syntax
```PowerShell
Import-StoredProcedure [[-Name] <String[]>] [-ConnectionStringOrSetting <String>] [-EmbedConnectionString] [<CommonParameters>]
```
