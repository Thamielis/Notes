Disable-NcSis
-------------

### Synopsis
Disable SIS (dedupe) on a volume.

---

### Description

Disable SIS (dedupe) on a volume.  If the SIS operation is active on the volume, it needs to be stopped using Stop-NcSis before disabling.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Enable-NcSis](Enable-NcSis)

* [Stop-NcSis](Stop-NcSis)

* [Get-NcSis](Get-NcSis)

---

### Examples
> Example 1

Disable-NcSis unitTestLuns | Get-NcSis
Disable dedupe on volume 'unitTestLuns' and display the resulting SIS status.

Path              State    Status ScheduleOrPolicy Progress
----              -----    ------ ---------------- --------
/vol/unitTestLuns disabled idle   sun-sat@0        Idle for 00:12:41

> Example 2

Get-NcVol | Disable-NcSis | Get-NcSis
Disable dedupe on all volumes.

Path                     State    Status ScheduleOrPolicy Progress
----                     -----    ------ ---------------- --------
/vol/cacacaca            disabled idle   sun-sat@0        Idle for 15:38:29
/vol/cModeDatastore      disabled idle   sun-sat@0        Idle for 15:40:29
/vol/cmodeDatastore1     disabled idle   sun-sat@0        Idle for 15:40:30
/vol/cModeDatastore2     disabled idle   sun-sat@0        Idle for 15:39:31
/vol/cModeDatastorezz    disabled idle   sun-sat@0        Idle for 15:39:33
/vol/costea01_root_vol   disabled idle   sun-sat@0        Idle for 15:40:34
/vol/georgeTestNFS       disabled idle   sun-sat@0        Idle for 15:39:35
/vol/mw3Rulez            disabled idle   sun-sat@0        Idle for 15:38:38
/vol/MW3RULEZA           disabled idle   sun-sat@0        Idle for 15:38:39
/vol/pleaseWorkDatastore disabled idle   sun-sat@0        Idle for 15:38:40
/vol/testvol             disabled idle   hourlyDedupe     Idle for 00:14:00
/vol/testvol2            disabled idle   sun-sat@0        Idle for 15:40:42
/vol/unitTestLuns        disabled idle   sun-sat@0        Idle for 00:14:33

---

### Parameters
#### **Name**
The volume on which to disable SIS.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>Volume|

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
API: sis-disable, sis-disable-async
Family: vserver

---

### Syntax
```PowerShell
Disable-NcSis [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Disable-NcSis [-Name] <String> -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
