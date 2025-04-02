Add-NcStorageIscsiInitiatorTarget
---------------------------------

### Synopsis
Add an iSCSI target.

---

### Description

Add an iSCSI target.

---

### Parameters
#### **Label**
The user defined identifier for the iSCSI target.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Node**
The name of the node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |2       |true (ByPropertyName)|NodeName|

#### **TargetName**
The target name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **TargetPortal**
The target's IP address.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **TargetType**
The type of the target: external, mailbox, or partner.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

#### **AdministrativeStatus**
Specifies the initial administrative status of the connection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: storage-iscsi-initiator
API: storage-iscsi-initiator-add-target
Family: cluster

---

### Syntax
```PowerShell
Add-NcStorageIscsiInitiatorTarget [-Label] <String> [-Node] <String> [-TargetName] <String> [-TargetPortal] <String> [-TargetType] <String> [-AdministrativeStatus <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
