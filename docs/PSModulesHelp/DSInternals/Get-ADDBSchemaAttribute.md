Get-ADDBSchemaAttribute
-----------------------

### Synopsis
Reads AD schema from a ntds.dit file, including datatable column names.

---

### Description

{{Fill in the Description}}

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-ADDBSchemaAttribute.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **LogPath**
Specifies the path to a directory where the transaction log files are located. For instance, C:\Windows\NTDS. The default log directory is the one that contains the database file itself.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |False        |Log<br/>TransactionLogPath|

#### **Name**
Specifies the name of a specific attribute to retrieve.

|Type        |Required|Position|PipelineInput |Aliases                                    |
|------------|--------|--------|--------------|-------------------------------------------|
|`[String[]]`|false   |0       |True (ByValue)|LdapDisplayName,AttributeName,AttrName,Attr|

---

### Inputs
System.String[]

---

### Outputs
* DSInternals.PowerShell.SchemaAttribute

---

### Notes

---

### Syntax
```PowerShell
Get-ADDBSchemaAttribute [[-Name] <String[]>] -DatabasePath <String> [-LogPath <String>] [<CommonParameters>]
```
