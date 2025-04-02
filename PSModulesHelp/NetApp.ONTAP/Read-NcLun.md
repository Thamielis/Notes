Read-NcLun
----------

### Synopsis
Read data into a Lun.This cmdlet is supported with Rest Only.

---

### Description

Read data into a Lun.

---

### Related Links
* [Write-NcLun](Write-NcLun)

* 

---

### Examples
> Example 1

```PowerShell
Read-NcLun -DataOffset 1024 -DataSize 3 -Path /vol/vol1/Protocol
tes

```

---

### Parameters
#### **DataOffset**
Specify within the LUN at which to Read the data

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[long?]`|true    |0       |true (ByPropertyName)|

#### **DataSize**
Specify the DataSize  to read.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Path**
Specify the path of LUN

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|true    |2       |true (ByPropertyName)|

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
Read-NcLun [-DataOffset] <long?> [-DataSize] <long?> [-Path] <string> [<CommonParameters>]
```
