Get-NcStorageIscsiInitiator
---------------------------

### Synopsis
Iterate over a list of iSCSI targets.

---

### Description

Iterate over a list of iSCSI targets.

---

### Parameters
#### **Label**
The user defined identifier for the iSCSI target.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
The name of the node.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeName|

#### **TargetType**
The type of the target: external, mailbox, or partner.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
The list of attributes of storage-iscsi-initiator objects.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[StorageIscsiInitiatorInfo]`|false   |named   |false        |

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
Specify to get an empty StorageIscsiInitiatorInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
A query that specifies which objects to return. A query could be specified on any number of attributes in the storage-iscsi-initiator object. All storage-iscsi-initiator objects matching this query up to 'max-records' will be returned.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[StorageIscsiInitiatorInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageIscsiInitiator.StorageIscsiInitiatorInfo

---

### Notes
Category: storage-iscsi-initiator
API: storage-iscsi-initiator-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageIscsiInitiator [[-Label] <String[]>] [[-Node] <String[]>] [[-TargetType] <String[]>] [-Attributes <StorageIscsiInitiatorInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageIscsiInitiator -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageIscsiInitiator -Query <StorageIscsiInitiatorInfo> [-Attributes <StorageIscsiInitiatorInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
