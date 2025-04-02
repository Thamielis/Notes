Enable-HTMLFeature
------------------

### Synopsis
Provides a way to enable existing feature or extending PSWriteHTML

---

### Description

Provides a way to enable existing feature or extending PSWriteHTML

---

### Examples
> EXAMPLE 1

```PowerShell
Enable-HTMLFeature -Feature Raphael, Mapael, Jquery, JQueryMouseWheel, "MapaelMaps_$Map"
```

---

### Parameters
#### **Feature**
Choose one of the existing features or define them via extension

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Configuration**
Provide hashtable with configuration of libraries

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Enable-HTMLFeature [[-Feature] <String[]>] [[-Configuration] <IDictionary>] [<CommonParameters>]
```
