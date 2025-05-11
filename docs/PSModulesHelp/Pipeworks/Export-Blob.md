Export-Blob
-----------

### Synopsis
Exports data to a cloud blob

---

### Description

Exports data to a blob in Azure

---

### Related Links
* [Get-Blob](Get-Blob)

* [Import-Blob](Import-Blob)

* [Remove-Blob](Remove-Blob)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem -Filter *.ps1 | Export-Blob -Container scripts -StorageAccount astorageAccount -StorageKey (Get-SecureSetting aStorageKey -ValueOnly)
```

---

### Parameters
#### **InputObject**
The input object for the blob.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|false   |named   |true (ByValue)|

#### **Container**
The name of the container

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The name of the blob

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ContentType**
The content type.  If a file is provided as input, this will be provided automatically.  If not, it will be text/plain

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **Public**
If set, the container the blob is put into will be made public

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Export-Blob [-InputObject <PSObject>] [-Container] <String> [-Name] <String> [-ContentType <String>] [-StorageAccount <String>] [-StorageKey <String>] [-Public] [<CommonParameters>]
```
