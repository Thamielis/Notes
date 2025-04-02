Start-NcSis
-----------

### Synopsis
Start a SIS (dedupe) operation on a volume.

---

### Description

Start a SIS (dedupe) operation on a volume.  The volume must have SIS enabled before starting a SIS operation.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcSis](Get-NcSis)

* [Enable-NcSis](Enable-NcSis)

* [Stop-NcSis](Stop-NcSis)

---

### Examples
> Example 1

Get-NcVol | Start-NcSis | Get-NcSis
Start a dedupe scan on all volumes.

Path                     State   Status ScheduleOrPolicy Progress
----                     -----   ------ ---------------- --------
/vol/cacacaca            enabled idle   sun-sat@0        Idle for 00:00:01
/vol/cModeDatastore      enabled idle   sun-sat@0        Idle for 00:00:01
/vol/cmodeDatastore1     enabled idle   sun-sat@0        Idle for 00:00:01
/vol/cModeDatastore2     enabled idle   sun-sat@0        Idle for 00:00:01
/vol/cModeDatastorezz    enabled idle   sun-sat@0        Idle for 00:00:01
/vol/costea01_root_vol   enabled idle   sun-sat@0        Idle for 00:00:01
/vol/georgeTestNFS       enabled idle   sun-sat@0        Idle for 00:00:01
/vol/mw3Rulez            enabled idle   sun-sat@0        Idle for 00:00:01
/vol/MW3RULEZA           enabled idle   sun-sat@0        Idle for 00:00:01
/vol/pleaseWorkDatastore enabled idle   sun-sat@0        Idle for 00:00:01
/vol/testvol             enabled idle   hourlyDedupe     Idle for 00:00:01
/vol/testvol2            enabled idle   sun-sat@0        Idle for 00:00:01
/vol/unitTestLuns        enabled idle   sun-sat@0        Idle for 00:00:01

---

### Parameters
#### **Name**
The volume on which to start a SIS operation.  The volume must be online.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>Volume|

#### **Scan**
If specified, the SIS operation will scan the file system to process all the existing data.  The scan will include whatever is enabled on the volume.  For example, if compression is not enabled on the volume, the scan will not include compression.  If not specified, only data added since the last SIS operation will be processed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RestartCheckpoint**
If specified, the SIS operation will restart from previous checkpoint without checking for validity.  This option should be used along with -Scan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DeleteCheckpoint**
If specified, the SIS operation will delete any existing checkpoint and start the SIS operation from the beginning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Queue**
If specified, the requested SIS operation will be queued if a SIS operation is already running on the volume and the running operation is in the fingerprint verification phase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScanAll**
If true, scanner will scan entire volume without applying shared block optimization.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BuildMetadata**
If true, scanner will scan the entire volume and generate fingerprint database without attempting the sharing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **QosPolicy**
QoS policy for the sis operation. 
Possible values:
"background" - sis operation will run in background with minimal or no impact on data serving client operations
"best-effort" - sis operations may have some impact on data serving client operations.
Default value: "best-effort"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RunCompactionScan**
Specify to start the compaction scanner on the volume.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.  If a VolumeAttributes object is piped to this cmdlet, the InfiniteVolume switch will be automatically set.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsInfiniteVolume|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: sis
API: sis-start, sis-start-async
Family: vserver

---

### Syntax
```PowerShell
Start-NcSis [-Name] <String> [-Scan] [-RestartCheckpoint] [-DeleteCheckpoint] [-Queue] [-ScanAll] [-BuildMetadata] [-QosPolicy <String>] [-RunCompactionScan] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Start-NcSis [-Name] <String> [-Scan] [-RestartCheckpoint] [-DeleteCheckpoint] [-Queue] -InfiniteVolume [-ScanAll] [-BuildMetadata] [-QosPolicy <String>] [-RunCompactionScan] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
