Export-VBRLocation
------------------

### Synopsis
Exports geographic locations from Veeam Backup & Replication.

---

### Description

This cmdlet exports geographic locations created in Veeam Backup & Replication to an XML file.

---

### Examples
> Exporting Geographic Locations to XML File

Export-VBRLocation -Path "C:\Locations\BackupNorth.xml"
This command exports geographic locations from Veeam Backup & Replication to an XML file.

---

### Parameters
#### **Force**
Defines that the cmdlet will overwrite the existing destination XML file without asking a user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
Specifies the path to the XML file. The cmdlet will export locations to this file.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Export-VBRLocation [-Force] -Path <String> [<CommonParameters>]
```
