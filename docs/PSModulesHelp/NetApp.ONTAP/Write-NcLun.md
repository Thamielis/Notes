Write-NcLun
-----------

### Synopsis
Write data into a Lun.This cmdlet is supported with Rest Only.

---

### Description

Write data into a Lun.

---

### Related Links
* [Read-NcLun](Read-NcLun)

* 

---

### Examples
> Example 1

```PowerShell
Write-NcLun -Data test -Path /vol/vol1/Protocol  -DataOffset 1024
```

---

### Parameters
#### **Data**
ASCII text to be written to the file

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|true    |0       |true (ByPropertyName)|

#### **Path**
Specify the path of Lun.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: Lun
API: /storage/luns/
Family: NcController

---

### Syntax
```PowerShell
Write-NcLun [-Data] <string> [-Path] <String> [-DataOffset] <long?> [<CommonParameters>]
```
