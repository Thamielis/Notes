Get-NcStorageShelfPort
----------------------

### Synopsis
Get information about one or more storage shelf ports.

---

### Description

Get information about one or more storage shelf ports.

---

### Parameters
#### **Shelf**
Shelf Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Id**
Port ID

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[StorageShelfPortInfo]`|false   |named   |false        |

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[StorageShelfPortInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: ses
API: storage-shelf-port-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelfPort [[-Shelf] <String[]>] [[-Id] <UInt64[]>] [-Attributes <StorageShelfPortInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfPort -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfPort -Query <StorageShelfPortInfo> [-Attributes <StorageShelfPortInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
