Add-VBRLocation
---------------

### Synopsis
Creates a geographic location in Veeam Backup & Replication.

---

### Description

This cmdlet creates a geographic location in Veeam Backup & Replication.
Run the Apply-VBRLocation cmdlet to assign locations to the backup infrastructure components.

---

### Related Links
* [Apply-VBRLocation](Apply-VBRLocation)

---

### Examples
> Creating Geographic Location

Add-VBRLocation -Name "ABC North"
This command creates a geographical location in Veeam Backup & Replication.

---

### Parameters
#### **Name**
Specifies the name you want to assign to the location.
The maximum length of the location name is 255 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

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
Add-VBRLocation -Name <String> [<CommonParameters>]
```
