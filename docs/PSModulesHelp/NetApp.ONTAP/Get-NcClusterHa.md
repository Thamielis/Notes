Get-NcClusterHa
---------------

### Synopsis
Get useful information about the status of the clustering service.

---

### Description

Get useful information about the status of the clustering service. If the monitor is not initialized, an error will be returned.

---

### Related Links
* [Enable-NcClusterHa](Enable-NcClusterHa)

* [Disable-NcClusterHa](Disable-NcClusterHa)

---

### Examples
> Example 1

Get-NcClusterHa VxeRubble-01
Get the cluster high availability information for node VxeRubble-01.

NcController                       : 10.60.189.172
BackupIoTimes                      : DataONTAP.C.Types.Cf.MailboxIoTimesInfo
BackupMailboxStatus                : {DataONTAP.C.Types.Cf.MailboxStatusInfo}
BootingReceived                    : 0
ControlPartnerAggregates           : False
CurrentGivebackModule              :
CurrentResourceTableEntry          :
CurrentResourceTableEntryIndex     :
CurrentTime                        : 1331843566
CurrentTimeDT                      : 3/15/2012 8:32:46 PM
FirmwareReceived                   : 589059618
InterconnectLinks                  : VIA Interconnect is up (link 0 up, link 1 up)
InterconnectType                   : Infiniband ( Mellanox Arbel )
IsEnabled                          : True
IsInterconnectUp                   : True
KillPackets                        : True
LocalFirmwareProgress              : 9178810
LocalFirmwareState                 : SF_UP
LocalMailboxDisks                  : {1a.02.0, 1a.02.1}
LogsUnsyncedCount                  : 0
MaxResourceTableIndex              : 157
Name                               : VxeRubble-01
NvramId                            : 151764873
Partner                            : VxeRubble-02
PartnerFirmwareProgress            : 9178915
PartnerFirmwareState               : SF_UP
PartnerMailboxDisks                : {1a.01.0, 1a.01.1}
PartnerName                        : VxeRubble-02
PartnerNvramId                     : 151764807
PrimaryIoTimes                     : DataONTAP.C.Types.Cf.MailboxIoTimesInfo
PrimaryMailboxStatus               :
ResourceTable                      : {Pre-rsrctbl: fmdisk_resumePartnerDi, Pre-rsrctbl: coredump_get_busy_spar, Pre-rsr
                                     ctbl: raid_preread_labels_be, Pre-rsrctbl: fmdisk_reserve_all...}
SfOptions                          : DataONTAP.C.Types.Cf.SfOptionsInfo
State                              : connected
TakeoverByPartnerNotPossibleReason :
TakeoverFailureReason              :
TakeoverOfPartnerNotPossibleReason :
TakeoverPossible                   : True
TimeMasterStatus                   : unknown
TimeUntilAutoGiveback              :
TimeUntilAutoGivebackTS            :
TimeUntilTakeover                  :
TimeUntilTakeoverTS                :
Timeouts                           : DataONTAP.C.Types.Cf.TimeoutInfo
TransitEventTime                   : 45820
TransitEventTimeTS                 : 00:00:45.8200000

---

### Parameters
#### **Node**
The name of the node for which high availability service status is being requested.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cf.ClusterHaStatus

---

### Notes
Category: cf
API: cf-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHa [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
