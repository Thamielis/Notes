New-NcQosStream
---------------

### Synopsis
Create a new stream.

---

### Description

Create a new stream.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosStream](Get-NcQosStream)

* [Remove-NcQosStream](Remove-NcQosStream)

---

### Examples
> Example 1

```PowerShell
New-NcQosStream -WorkloadUuid f7c38bee-6de3-11e1-a794-123478563412 -Vserver dlamotta01 -Lun lun0
Create a new quality of service stream for the given workload for vserver dlamotta01 and lun lun0.

Vserver           : dlamotta01
Volume            : luns
Qtree             :
Lun               : lun0
StreamId          : 0
NcController      : 10.60.189.172
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
WorkloadUuid      : f7c38bee-6de3-11e1-a794-123478563412
StreamIdSpecified : True

```
> Example 2

```PowerShell
Get-NcQosWorkload test-workload | New-NcQosStream -Vserver dlamotta01 -Volume cifs
Create a quality of service stream for the workload named "test-workload"

Vserver           : dlamotta01
Volume            : cifs
Qtree             :
Lun               :
StreamId          : 1
NcController      : 10.60.189.172
Characteristics   : {DataONTAP.C.Types.Qos.QosStreamCharacteristics}
WorkloadUuid      : f7c38bee-6de3-11e1-a794-123478563412
StreamIdSpecified : True

```

---

### Parameters
#### **WorkloadUuid**
Universally unique identifier for the workload to which the stream is attached.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Vserver stream characteristic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Volume**
Volume name stream characteristic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Qtree**
Qtree name stream characteristic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Lun**
Lun name stream characteristic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosStreamInfo

---

### Notes
Category: qos
API: qos-stream-create
Family: cluster

---

### Syntax
```PowerShell
New-NcQosStream [-WorkloadUuid] <String> [[-Vserver] <String>] [[-Volume] <String>] [[-Qtree] <String>] [[-Lun] <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
