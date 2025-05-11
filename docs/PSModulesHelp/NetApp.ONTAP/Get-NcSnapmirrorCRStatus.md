Get-NcSnapmirrorCRStatus
------------------------

### Synopsis
Obtain the results of the SnapMirror config replication status check.

---

### Description

Obtain the results of the SnapMirror config replication status check.

---

### Related Links
* [Get-NcSnapmirrorCRClusterStorageConfiguration](Get-NcSnapmirrorCRClusterStorageConfiguration)

* [Set-NcSnapmirrorCRClusterStorageConfiguration](Set-NcSnapmirrorCRClusterStorageConfiguration)

* [Get-NcSnapmirrorCrStatusComm](Get-NcSnapmirrorCrStatusComm)

* [Get-NcSnapmirrorCrStatusAggregateEligibility](Get-NcSnapmirrorCrStatusAggregateEligibility)

---

### Examples
> Example 1

Get-NcSnapmirrorCRStatus
Return all information from SnapMirror config replication status check.

IsEnabled               : False
IsRunning               : False
NcController            : 10.238.49.117
RecoverySteps           : Verify that Vserver DR has been configured. If Vserver DR has already been configured 
                          successfully, check storage status below. If storage status is "ok", contact technical 
                          support for assistance.
StorageInUse            : 
StorageNonHealthyReason : 
StorageRecoverySteps    : 
StorageStatus           : 
VserverRecoverySteps    : Run the "snapmirror show -instance" command for more details.
VserverStreams          : ok
IsEnabledSpecified      : True
IsRunningSpecified      : True

---

### Parameters
#### **DesiredAttributes**
Specify to restrict fields returned by Data ONTAP

|Type                      |Required|Position|PipelineInput        |Aliases   |
|--------------------------|--------|--------|---------------------|----------|
|`[SnapmirrorCrStatusInfo]`|false   |1       |true (ByPropertyName)|Attributes|

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorCrStatusInfo

---

### Notes
Category: snapmirror
API: snapmirror-cr-status-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirrorCRStatus [[-DesiredAttributes] <SnapmirrorCrStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
