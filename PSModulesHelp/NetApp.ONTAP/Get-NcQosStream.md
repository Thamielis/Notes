Get-NcQosStream
---------------

### Synopsis
Get a list of streams.

---

### Description

Get a list of streams.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [New-NcQosStream](New-NcQosStream)

* [Remove-NcQosStream](Remove-NcQosStream)

---

### Examples
> Example 1

```PowerShell
Get-NcQosStream -Vserver dlamotta01
Get all of the quality of service streams that name vserver "dlamotta01" in the stream characteristics.

Vserver           : dlamotta01
Volume            : cifs
Qtree             :
Lun               :
StreamId          : 0
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
WorkloadUuid      : f7c38bee-6de3-11e1-a794-123478563412
StreamIdSpecified : True

Vserver           : dlamotta01
Volume            : luns
Qtree             :
Lun               : lun0
StreamId          : 1
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
WorkloadUuid      : f7c38bee-6de3-11e1-a794-123478563412
StreamIdSpecified : True

```
> Example 2

```PowerShell
Get-NcQosWorkload test-workload | Get-NcQosStream
Get all the quality of service streams for the workload test-workload.

Vserver           : dlamotta01
Volume            : cifs
Qtree             :
Lun               :
NcController      : 10.60.189.172
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
StreamId          : 0
WorkloadUuid      : aba034e9-6e00-11e1-a794-123478563412
StreamIdSpecified : True

Vserver           : dlamotta01
Volume            : luns
Qtree             :
Lun               : lun0
NcController      : 10.60.189.172
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
StreamId          : 1
WorkloadUuid      : aba034e9-6e00-11e1-a794-123478563412
StreamIdSpecified : True

```

---

### Parameters
#### **StreamId**
Identifier for this stream.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **WorkloadUuid**
Universally unique identifier for the workload to which the stream is attached.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Vserver stream characteristic.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Volume**
Volume name stream characteristic.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Qtree**
Qtree name stream characteristic.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Lun**
Lun name stream characteristic.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |6       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a QosStreamInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQosStream -Template" to get the initially empty QosStreamInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosStreamInfo]`|false   |named   |false        |

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
Specify to get an empty QosStreamInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosStreamInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosStream -Template" to get the initially empty QosStreamInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosStreamInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosStreamInfo

---

### Notes
Category: qos
API: qos-stream-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosStream [[-StreamId] <String[]>] [[-WorkloadUuid] <String[]>] [[-Vserver] <String[]>] [[-Volume] <String[]>] [[-Qtree] <String[]>] [[-Lun] <String[]>] [-Attributes <QosStreamInfo>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosStream -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcQosStream -Query <QosStreamInfo> [-Attributes <QosStreamInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
