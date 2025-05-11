Get-NcStorageBridgeCoredump
---------------------------

### Synopsis
Return a list of coredumps available.

---

### Description

Return a list of coredumps available.

---

### Parameters
#### **Corename**
The name of the coredump file

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SerialNumber**
Serial number of the bridge that generated the coredump.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[StorageBridgeCoredumpInfo]`|false   |named   |false        |

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

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[StorageBridgeCoredumpInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: storage bridge
API: storage-bridge-coredump-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageBridgeCoredump [[-Corename] <String[]>] [[-SerialNumber] <String[]>] [-Attributes <StorageBridgeCoredumpInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageBridgeCoredump -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageBridgeCoredump -Query <StorageBridgeCoredumpInfo> [-Attributes <StorageBridgeCoredumpInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
