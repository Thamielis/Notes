Stop-NcAggrScrub
----------------

### Synopsis
Stop parity scrubbing on the named aggregate, plex, or RAID group.

---

### Description

Stop parity scrubbing on the named aggregate, plex, or RAID group.  If no name is given, scrubbing will stop on all RAID groups currently being scrubbed.

---

### Related Links
* [Start-NcAggrScrub](Start-NcAggrScrub)

* [Suspend-NcAggrScrub](Suspend-NcAggrScrub)

* [Resume-NcAggrScrub](Resume-NcAggrScrub)

* [Get-NcAggrScrub](Get-NcAggrScrub)

---

### Examples
> Example 1

```PowerShell
Stop-NcAggrScrub test_aggr
Stop the scrubbing for aggregate test_aggr.

IsSuspended                 : False
LastScrubTimestamp          : 1362292786
LastScrubTimestampDT        : 3/3/2013 1:39:46 AM
NcController                : 10.63.165.62
PercentageComplete          :
RaidGroup                   : /test_aggr/plex0/rg0
LastScrubTimestampSpecified : True
PercentageCompleteSpecified : False

```

---

### Parameters
#### **Name**
Name or UUID of the entity for which scrubbing is to stop.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Plex**
If provided, this specifies the plex name. Ex: plex0.  Must be used in conjunction with Name parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RaidGroup**
If provided, this specifies the RAID group. Ex: rg2.  Must be used in conjunction with Name and Plex parameters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Node**
Name of node on which the aggr is hosted.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |4       |true (ByValue)|

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
API: aggr-scrub-stop
Family: cluster

---

### Syntax
```PowerShell
Stop-NcAggrScrub [[-Name] <String>] [[-Plex] <String>] [[-RaidGroup] <String>] [[-Node] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
