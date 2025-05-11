Stop-NcSis
----------

### Synopsis
Abort any currently active SIS (dedupe) operation on the volume.

---

### Description

Abort any currently active SIS (dedupe) operation on the volume.  The SIS operation will remain paused and the operation can be resumed by Start-NcSis or the scheduler.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcSis](Get-NcSis)

* [Disable-NcSis](Disable-NcSis)

* [Start-NcSis](Start-NcSis)

---

### Examples
> Example 1

Get-NcVol | Stop-NcSis | Get-NcSis
Stop dedupe operations on all volumes.

Path                     State   Status ScheduleOrPolicy Progress
----                     -----   ------ ---------------- --------
/vol/cacacaca            enabled idle   sun-sat@0        Idle for 00:19:43
/vol/cModeDatastore      enabled idle   sun-sat@0        Idle for 00:19:46
/vol/cmodeDatastore1     enabled idle   sun-sat@0        Idle for 00:19:46
/vol/cModeDatastore2     enabled idle   sun-sat@0        Idle for 00:19:47
/vol/cModeDatastorezz    enabled idle   sun-sat@0        Idle for 00:19:46
/vol/costea01_root_vol   enabled idle   sun-sat@0        Idle for 00:19:46
/vol/georgeTestNFS       enabled idle   sun-sat@0        Idle for 00:19:47
/vol/mw3Rulez            enabled idle   sun-sat@0        Idle for 00:19:46
/vol/MW3RULEZA           enabled idle   sun-sat@0        Idle for 00:19:47
/vol/pleaseWorkDatastore enabled idle   sun-sat@0        Idle for 00:19:47
/vol/testvol             enabled idle   hourlyDedupe     Idle for 00:19:47
/vol/testvol2            enabled idle   sun-sat@0        Idle for 00:19:47
/vol/unitTestLuns        enabled idle   sun-sat@0        Idle for 00:19:47

---

### Parameters
#### **Name**
The volume on which to stop a SIS operation.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>Volume|

#### **All**
If specified, both active and queued SIS operations will be stopped.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: sis-stop, sis-stop-async
Family: vserver

---

### Syntax
```PowerShell
Stop-NcSis [-Name] <String> [-All] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Stop-NcSis [-Name] <String> [-All] -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
