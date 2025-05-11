Test-VBRQuickMigration
----------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Datastore**

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **Entity**

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CViVmItem]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Folder**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **ResourcePool**

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **StoragePolicy**

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViVmItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Test-VBRQuickMigration [-Datastore <CViDatastoreItem>] -Entity <CViVmItem> [-Folder <CViFolderItem>] [-ResourcePool <CViResourcePoolItem>] [-RunAsync] -Server <CHost> [-StoragePolicy <VBRViStoragePolicy>] 
```
```PowerShell
[<CommonParameters>]
```
