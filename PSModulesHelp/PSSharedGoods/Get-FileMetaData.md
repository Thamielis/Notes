Get-FileMetaData
----------------

### Synopsis
Small function that gets metadata information from file providing similar output to what Explorer shows when viewing file

---

### Description

Small function that gets metadata information from file providing similar output to what Explorer shows when viewing file

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem -Path $Env:USERPROFILE\Desktop -Force | Get-FileMetaData | Out-HtmlView -ScrollX -Filtering -AllProperties
```
> EXAMPLE 2

```PowerShell
Get-ChildItem -Path $Env:USERPROFILE\Desktop -Force | Where-Object { $_.Attributes -like '*Hidden*' } | Get-FileMetaData | Out-HtmlView -ScrollX -Filtering -AllProperties
```

---

### Parameters
#### **File**
FileName or FileObject

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **HashAlgorithm**

Valid Values:

* None
* MACTripleDES
* MD5
* RIPEMD160
* SHA1
* SHA256
* SHA384
* SHA512

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Signature**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHashTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-FileMetaData [[-File] <Object>] [-HashAlgorithm <String>] [-Signature] [-AsHashTable] [<CommonParameters>]
```
