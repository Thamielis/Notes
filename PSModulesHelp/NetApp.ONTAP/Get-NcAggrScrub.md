Get-NcAggrScrub
---------------

### Synopsis
Get the status of parity scrubbing on the named aggregate.

---

### Description

Get the status of parity scrubbing on the named aggregate. Status includes percentage complete and the scrub's suspended status (if appropriate).  If no name is given, then status is generated for all RAID groups.

---

### Related Links
* [Start-NcAggrScrub](Start-NcAggrScrub)

---

### Examples
> Example 1

```PowerShell
Get-NcAggrScrub
Get the status of all aggregate scrub operations.

IsSuspended                 : False
LastScrubTimestamp          : 1362292786
LastScrubTimestampDT        : 3/3/2013 1:39:46 AM
NcController                : 10.63.165.62
PercentageComplete          : 0
RaidGroup                   : /test_aggr/plex0/rg0
LastScrubTimestampSpecified : True
PercentageCompleteSpecified : True

```

---

### Parameters
#### **Name**
Name or UUID of the entity to show scrubbing status for.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Node**
Name of the node.

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
* DataONTAP.C.Types.Volume.ScrubDetailInfo

---

### Notes
Category: aggr
API: aggr-scrub-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrScrub [[-Name] <String>] [-Node <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
