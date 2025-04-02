Start-NcVolExpand
-----------------

### Synopsis
Allows the user to increase the size of a FlexGroup by adding constituents.

---

### Description

Allows the user to increase the size of a FlexGroup by adding constituents. The size of the new constituents is determined by the size of the smallest existing constituent.  This API is not supported for Flexible Volumes, FlexGroup  constituents, Infinite Volumes or Infinite Volume constituents.

---

### Examples
> Example 1

Start-NcVolExpand -VolumeName flexvol1 -Aggregate aggr1
Allows the user to increase the size of a FlexGroup by adding constituents.

NcController : 10.238.73.251
ErrorCode    :
ErrorMessage :
JobId        : 75
JobVserver   :
Status       : in_progress

PS C:\PSTK\PSTK_BurtFixes\depot\prod\diapason\main\NcCmdlet\bin\Debug> Get-NcVol -Volume flexvol1
Name                      State       TotalSize  Used  Available Dedupe Aggregate                 Vserver
----                      -----       ---------  ----  --------- ------ ---------                 -------
flexvol1                  online         1.0 GB   32%   713.3 MB False                            vs1

---

### Parameters
#### **VolumeName**
The name of the FlexGroup to expand.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Name,Volume,VolName|

#### **Aggregate**
Specifies an array of names of aggregates to be used for FlexGroup constituents. Each entry in the array will create a constituent on the specified aggregate. An aggregate may be specified multiple times to have multiple constituents created on it. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **AggrListMultiplier**
Specifies the number of times to iterate over the aggregates listed with the -aggr-list parameter when creating a FlexGroup. The aggregate list will be repeated the specified number of times. For example, if the aggr-list is "aggr1,aggr2" and the aggr-list-multiplier is 2 four constituents to be created in the order aggr1, aggr2, aggr1, aggr2. The number of constituents created on a node contributes to the maximum volume limit per node, which cannot be exceeded. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |Aliases       |
|---------|--------|--------|---------------------|--------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|AggrMultiplier|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Size**
Size of the Volume, must be greater than the existing volume size. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: volume
API: volume-expand-async
Family: vserver

---

### Syntax
```PowerShell
Start-NcVolExpand [-VolumeName] <String> [-Aggregate] <String[]> [-AggrListMultiplier <Int32>] [-VserverContext <String>] -Size <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
