Import-Blob
-----------

### Synopsis
Imports from blob storage

---

### Description

Imports content from azure blob storage

---

### Related Links
* [Export-Blob](Export-Blob)

* [Get-Blob](Get-Blob)

* [Remove-Blob](Remove-Blob)

---

### Examples
> EXAMPLE 1

```PowerShell
"hello world" | Export-Blob acontainer ablob.txt -StorageAccount myStorageAccount -StorageKey myStorageKey 
Import-Blob acontainer ablob.txt
```

---

### Parameters
#### **Container**
The name of the container

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The name of the item

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **StorageAccount**
The storage account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKey**
The storage key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[])

---

### Syntax
```PowerShell
Import-Blob [-Container] <String> [-Name] <String> [-StorageAccount <String>] [-StorageKey <String>] [<CommonParameters>]
```
