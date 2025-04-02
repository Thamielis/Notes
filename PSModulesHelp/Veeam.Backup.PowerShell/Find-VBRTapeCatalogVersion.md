Find-VBRTapeCatalogVersion
--------------------------

### Synopsis
Looks for versions of files stored on tapes.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **CatalogFile**

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CatalogueFile]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Tape.Core.CatalogueFile

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRTapeCatalogVersion [-CatalogFile <CatalogueFile>] [-Name <String[]>] [<CommonParameters>]
```
