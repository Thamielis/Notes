Start-VBRTapeRestoreFiles
-------------------------

### Synopsis
IMPORTANT! This cmdlet is obsolete.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Files**

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CatalogueFile[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Overwrite**

Valid Values:

* None
* Newer
* Always

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[RestoreOverwrite]`|false   |named   |False        |

#### **Path**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreserveHierarhy**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Security**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **Version**

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[CatalogueFileVersion[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Tape.Core.CatalogueFile[]

Veeam.Tape.Core.CatalogueFileVersion[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRTapeRestoreFiles [-Files <CatalogueFile[]>] [-Overwrite {None | Newer | Always}] -Path <String> [-PreserveHierarhy] [-RunAsync] [-Security] -Server <CHost> [-Version <CatalogueFileVersion[]>] 
```
```PowerShell
[<CommonParameters>]
```
