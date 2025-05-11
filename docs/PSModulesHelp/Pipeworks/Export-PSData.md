Export-PSData
-------------

### Synopsis
Exports property bags into a data file

---

### Description

Exports property bags and the first level of any other object into a ps data file (.psd1)

---

### Related Links
* [Import-PSData](Import-PSData)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Web -Url http://www.youtube.com/watch?v=xPRC3EDR_GU -AsMicrodata -ItemType http://schema.org/VideoObject | 
    Export-PSData .\PipeworksQuickstart.video.psd1
```

---

### Parameters
#### **InputObject**
The data that will be exported

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **DataFile**
The path to the data file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Export-PSData -InputObject <PSObject[]> [-DataFile] <String> [<CommonParameters>]
```
