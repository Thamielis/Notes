Get-NcAggrObjectStoreVolBtuuids
-------------------------------

### Synopsis
Display a list of volume buftree UUIDs in a FabricPool aggregate.

---

### Description

Display a list of volume buftree UUIDs in a FabricPool aggregate.

---

### Parameters
#### **Aggregate**
Name of the aggregate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **ObjectStoreName**
Name of the object store configuration attached to the aggregate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **BuftreeUuid**
Buftree UUID of the volume.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information isavailable will be returned.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ObjectStoreVolBtuuidsInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty aggrobjectstorevolbtuuids object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a aggrobjectstorevolbtuuids object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrObjectStoreVolBtuuids -Template" to get the initially empty aggrobjectstorevolbtuuids object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ObjectStoreVolBtuuidsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.ObjectStoreVolBtuuidsInfo

---

### Notes
Category: aggr
API: aggr-object-store-vol-btuuids-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrObjectStoreVolBtuuids [[-Aggregate] <String[]>] [[-ObjectStoreName] <String[]>] [[-BuftreeUuid] <String[]>] [-Attributes <ObjectStoreVolBtuuidsInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrObjectStoreVolBtuuids -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrObjectStoreVolBtuuids -Query <ObjectStoreVolBtuuidsInfo> [-Attributes <ObjectStoreVolBtuuidsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
