Update-NcSnapmirror
-------------------

### Synopsis
Changes one or more parameters of one or more SnapMirror relationships.

---

### Description

Changes one or more parameters of one or more SnapMirror relationships.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

* [Set-NcSnapmirror](Set-NcSnapmirror)

---

### Examples
> Example 1

```PowerShell
$query = Get-NcSnapmirror -Template
$query.DestinationLocation = "VxeRubble://*"
Update-NcSnapmirror -Query $query -Schedule 8hour -MaxTransferRate 1mb
Update all SnapMirror relationships with destinations on cluster 'VxeRubble'.

NcController : VxeRubble
SuccessCount : 3
FailureCount : 0
SuccessList  : {VxeRubble://costea01/unitTestLuns --> VxeRubble://costea02/unitTestLunsSM, VxeRubble://costea01/vol1 --> VxeRubble://costea01/vol1_LS1, VxeRubble://costea01/vol1 --> VxeRubble://costea01/vol1_LS2}
FailureList  : {}

```

---

### Parameters
#### **Query**
A SnapmirrorInfo object with various fields set to indicate which SnapMirror relationships to modify.  Other fields should remain set to null.  Use "Get-NcSnapmirror -Template" to get the initially empty SnapmirrorInfo object.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[SnapmirrorInfo]`|true    |named   |true (ByValue)|

#### **Schedule**
Name of the schedule on which the relationship operates.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Tries**
Specifies the maximum number of times to attempt each manual or scheduled transfer for a SnapMirror relationship.  Note: You can set the tries option to zero (0) to disable manual and scheduled updates for the SnapMirror relationship.

|Type     |Required|Position|PipelineInput        |Aliases             |
|---------|--------|--------|---------------------|--------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Retry<br/>RetryCount|

#### **MaxTransferRate**
Specifies the upper bound, in bytes per second, at which data is transferred between clusters.  The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  This option does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Policy**
Name of the SnapMirror policy that applies to this relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue modifying the next matching object even when modification of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed modify operations before the server gives up and returns.  If set, the cmdlet will continue modifying the next matching object even when the modification of a previous matching object fails, and do so until the total number of objects failed to be modified reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed modify operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IsAutoExpandEnabled**
Specifies if the FlexGroup SnapMirror relationship and its destination FlexGroup should be auto-expanded if the source FlexGroup is expanded. This parameter is supported only for FlexGroup SnapMirror relationships. If the initialize is creating a new SnapMirror relationship, the default value is true. If it is not creating a new relationship, if a value is specified, it must match the current value for the existing relationship. If the parameter is not specified, the existing value will be retained.
This parameter is only supported in ONTAP 9.3. or later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: snapmirror
API: snapmirror-modify-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Update-NcSnapmirror -Query <SnapmirrorInfo> [-Schedule <String>] [-Tries <Int32>] [-MaxTransferRate <Int64>] [-Policy <String>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] 
```
```PowerShell
[-IsAutoExpandEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
