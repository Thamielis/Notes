Enable-NcSis
------------

### Synopsis
Enable SIS (dedupe) on a volume.

---

### Description

Enable SIS (dedupe) on a volume.  This cmdlet does not enable compression on the volume.  See Set-NcSis for options to enable compression and for modifying the default schedule set on the volume.  An SIS operation can also be manually started using Start-NcSis.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcSis](Get-NcSis)

* [Start-NcSis](Start-NcSis)

* [Set-NcSis](Set-NcSis)

---

### Examples
> Example 1

Enable-NcSis unitTestLuns | Get-NcSis
Enable dedupe on volume 'unitTestLuns' and display the resulting SIS status.

Path              State   Status ScheduleOrPolicy Progress
----              -----   ------ ---------------- --------
/vol/unitTestLuns enabled idle   sun-sat@0        Idle for 00:15:37

> Example 2

Get-NcVol | Enable-NcSis | Get-NcSis
Enable dedupe on all volumes.

Path                     State   Status ScheduleOrPolicy Progress
----                     -----   ------ ---------------- --------
/vol/cacacaca            enabled idle   sun-sat@0        Idle for 15:40:28
/vol/cModeDatastore      enabled idle   sun-sat@0        Idle for 15:42:28
/vol/cmodeDatastore1     enabled idle   sun-sat@0        Idle for 15:42:29
/vol/cModeDatastore2     enabled idle   sun-sat@0        Idle for 15:41:31
/vol/cModeDatastorezz    enabled idle   sun-sat@0        Idle for 15:41:32
/vol/costea01_root_vol   enabled idle   sun-sat@0        Idle for 15:42:33
/vol/georgeTestNFS       enabled idle   sun-sat@0        Idle for 15:41:35
/vol/mw3Rulez            enabled idle   sun-sat@0        Idle for 15:40:37
/vol/MW3RULEZA           enabled idle   sun-sat@0        Idle for 15:40:38
/vol/pleaseWorkDatastore enabled idle   sun-sat@0        Idle for 15:40:39
/vol/testvol             enabled idle   hourlyDedupe     Idle for 00:16:00
/vol/testvol2            enabled idle   sun-sat@0        Idle for 15:42:41
/vol/unitTestLuns        enabled idle   sun-sat@0        Idle for 00:16:32

---

### Parameters
#### **Name**
The volume on which to enable SIS.

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
API: sis-enable, sis-enable-async
Family: vserver

---

### Syntax
```PowerShell
Enable-NcSis [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Enable-NcSis [-Name] <String> -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
