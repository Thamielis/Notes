Get-Blob
--------

### Synopsis
Gets blob of cloud data

---

### Description

Gets blob of cloud data in Azure

---

### Related Links
* [Remove-Blob](Remove-Blob)

* [Import-Blob](Import-Blob)

* [Export-Blob](Export-Blob)

---

### Examples
Get all containers

```PowerShell
Get-Blob -StorageAccount MyAzureStorageAccount -StorageKey MyAzureStorageKey
```
Get all items in mycontainer

```PowerShell
Get-Blob -StorageAccount MyAzureStorageAccount -StorageKey MyAzureStorageKey -Container MyContainer
```

---

### Parameters
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

#### **Prefix**
The blob prefix

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

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-Blob [-Prefix <String>] [-StorageAccount <String>] [-StorageKey <String>] [<CommonParameters>]
```
```PowerShell
Get-Blob [-Container] <String> [-Prefix <String>] [-StorageAccount <String>] [-StorageKey <String>] [<CommonParameters>]
```
```PowerShell
Get-Blob [-Container] <String> [-Name] <String> [-Prefix <String>] [-StorageAccount <String>] [-StorageKey <String>] [<CommonParameters>]
```
