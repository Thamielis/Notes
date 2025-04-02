Update-NcVol
------------

### Synopsis
Modify the attributes of volume or a group of volume objects.

---

### Description

Modify the attributes of volume or a group of volume objects.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcVol](Get-NcVol)

---

### Examples
> Example 1

$q = Get-NcVol -Template
Initialize-NcObjectProperty $q VolumeIdAttributes
$q.VolumeIdAttributes.Name = "vol1|vol2"
$q.VolumeIdAttributes.OwningVserverName = "vserver1"
$a = Get-NcVol -Template
Initialize-NcObjectProperty $a VolumeIdAttributes
$a.VolumeIdAttributes.Comment = "Database volumes"
Update-NcVol -Query $q -Attributes $a
Using this cmdlet and others, execute an advanced query to set the comment field on multiple volumes.

NcController : 10.61.172.155
SuccessCount : 2
FailureCount : 0
SuccessList  : {vol1, vol2}
FailureList  : {}

---

### Parameters
#### **Query**
A VolumeAttributes object with various fields set to indicate which volumes to modify.  Other fields should remain set to null.  Use "Get-NcVol -Template" to get the initially empty VolumeAttributes object.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VolumeAttributes]`|true    |named   |true (ByValue)|

#### **Attributes**
A VolumeAttributes object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcVol -Template" to get the initially empty VolumeAttributes object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VolumeAttributes]`|true    |named   |false        |

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

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.  If a VolumeAttributes object is piped to this cmdlet, the InfiniteVolume switch will be automatically set.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsInfiniteVolume|

#### **FlexGroupVolume**

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsFlexGroupVolume|

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
Category: volume
API: volume-modify-iter, volume-modify-iter-async
Family: cluster, vserver

---

### Syntax
```PowerShell
Update-NcVol -Query <VolumeAttributes> -Attributes <VolumeAttributes> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-VserverContext <String>] [-InfiniteVolume] [-FlexGroupVolume] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
