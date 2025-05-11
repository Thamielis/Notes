Find-VBRTapeCatalogItemVersion
------------------------------

### Synopsis
Looks for backed up versions of a file or folder.

---

### Description

This cmdlet looks for backed-up versions of a file or folder to be further used by the Start-VBRTapeFileRestore cmdlet.

---

### Related Links
* [Find-VBRTapeCatalogItem](Find-VBRTapeCatalogItem)

---

### Examples
> Example - Getting Version of File Backed-Up by Tape Job

$item = Find-VBRTapeCatalogItem 
Find-VBRTapeCatalogItemVersion -CatalogItem $item[3]
This example shows how to get versions of a file backed-up by the tape job.

Perform the following steps:
1. Run the Find-VBRTapeCatalogItem cmdlet. Save the result to the $item variable.
2. Run the Find-VBRTapeCatalogItemVersion cmdlet. Set the $item variable as the CatalogItem parameter value.

---

### Parameters
#### **CatalogItem**
Specifies a file or folder. The cmdlet will find versions of this file or folder. Accepts the VBRTapeCatalogItem[] object. To get this object, run the Find-VBRTapeCatalogItem cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRTapeCatalogItem]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRTapeCatalogItemVersion -CatalogItem <VBRTapeCatalogItem> [<CommonParameters>]
```
