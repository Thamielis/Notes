Import-VBRLocation
------------------

### Synopsis
Imports geographic locations to Veeam Backup & Replication.

---

### Description

This cmdlet imports geographic locations to Veeam Backup & Replication from an XML file.

---

### Examples
> Importing Geographic Locations from XML File

Import-VBRLocation -Path "C:\Locations\BackupNorth.xml"
This command imports geographic locations to Veeam Backup & Replication from an XML file.

---

### Parameters
#### **Path**
Specifies the name of the XML file. The cmdlet will import locations to Veeam Backup & Replication from this file.

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
Import-VBRLocation -Path <String> [<CommonParameters>]
```
