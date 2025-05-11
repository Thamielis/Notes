Export-GPOZaurrContent
----------------------

### Synopsis
Exports Group Policy Objects (GPOs) to XML or HTML files.

---

### Description

This function exports GPOs to either XML or HTML files based on the specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Export-GPOZaurrContent -FolderOutput "C:\ExportedGPOs" -ReportType HTML
Exports all GPOs to HTML format and saves them in the "C:\ExportedGPOs" folder.
```

---

### Parameters
#### **FolderOutput**
Specifies the folder path where the exported GPO files will be saved.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |Path   |

#### **ReportType**
Specifies the type of report to generate. Valid values are XML or HTML. The default value is XML.
Valid Values:

* XML
* HTML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
This function exports GPOs to XML or HTML files for further analysis or backup purposes.

---

### Syntax
```PowerShell
Export-GPOZaurrContent [-FolderOutput] <String> [[-ReportType] <String>] [<CommonParameters>]
```
