Get-NcFcAdapter
---------------

### Synopsis
Get a list of fc adapters.

---

### Description

Get a list of fc adapters.

---

### Related Links
* [Enable-NcFcAdapter](Enable-NcFcAdapter)

* [Disable-NcFcAdapter](Disable-NcFcAdapter)

* [Set-NcFcAdapterType](Set-NcFcAdapterType)

---

### Examples
> Example 1

Get-NcFcAdapter
Get all the fc adapters on the current cluster.

NodeName                         AdapterName    AdapterType                AdapterState               AdapterStatus
--------                         -----------    -----------                ------------               -------------
VxeRubble-01                     0a             target                     CONFIGURED                 online
VxeRubble-01                     0b             initiator                  CONFIGURED.                offline
VxeRubble-01                     0c             initiator                  CONFIGURED.                offline
VxeRubble-01                     0d             initiator                  CONFIGURED.                offline
VxeRubble-02                     0a             target                     CONFIGURED                 online
VxeRubble-02                     0b             initiator                  CONFIGURED.                offline
VxeRubble-02                     0c             initiator                  CONFIGURED.                offline
VxeRubble-02                     0d             initiator                  CONFIGURED.                offline

> Example 2

```PowerShell
$q = Get-NcFcAdapter -Template
$q.PendingFcType = "unconfigured"
Get-NcFcAdapter -Query $q
Get all of the fc adapters that have a pending type of "unconfigured".

NcController  : 10.60.189.172
AdapterName   : 0d
AdapterState  : CONFIGURED.
AdapterStatus : offline
AdapterType   : initiator
NodeName      : VxeRubble-02
PendingFcType : unconfigured

```

---

### Parameters
#### **Node**
The name of the node containing the adapter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Adapter**
The name of an FC adapter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|AdapterName|

#### **Type**
The adapter type.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |3       |true (ByPropertyName)|AdapterType|

#### **Attributes**
For improved scalability in large clusters, provide an FcConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcAdapter -Template" to get the initially empty FcConfig object.  If not specified, all data is returned for each object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[FcConfig]`|false   |named   |false        |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty FcConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FcConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcAdapter -Template" to get the initially empty FcConfig object.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[FcConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fc.FcConfig

---

### Notes
Category: fc
API: fc-config-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcAdapter [[-Node] <String[]>] [[-Adapter] <String[]>] [[-Type] <String[]>] [-Attributes <FcConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcAdapter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcFcAdapter -Query <FcConfig> [-Attributes <FcConfig>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
