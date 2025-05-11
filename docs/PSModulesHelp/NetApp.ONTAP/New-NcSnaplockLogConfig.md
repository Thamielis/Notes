New-NcSnaplockLogConfig
-----------------------

### Synopsis
Create audit log configuration for a Vserver.

---

### Description

Create audit log configuration for a Vserver.

A job is spawned and the job id  will be returned. The progress of the job can be tracked using the Get-NcJob cmdlet.

---

### Related Links
* [Get-NcSnaplockLogConfig](Get-NcSnaplockLogConfig)

* [Set-NcSnaplockLogConfig](Set-NcSnaplockLogConfig)

* [Remove-NcSnaplockLogConfig](Remove-NcSnaplockLogConfig)

---

### Examples
> Example 1

```PowerShell
New-NcSnaplockLogConfig -MaxLogSize 1m -Volume locked -VserverContext primary1 | FL
Create a new configuration for Snaplock Audit Logs in primary1 vserver

NcController     : 10.63.1.234
VserverLogConfig : DataONTAP.C.Types.Snaplock.SnaplockVserverLogConfig
Status           : in_progress
JobID            : 2388
ErrorCode        :

```

---

### Parameters
#### **Volume**
Name of the log volume.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |1       |true (ByPropertyName)|Vol<br/>VolumeName|

#### **MaxLogSize**
The maximum allowed log file size - specified as <number><units>. Valid units are b|kb|mb|gb

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DefaultRetentionPeriod**
Specifies the allowed minimum retention period for SnapLock log files to be committed to WORM state on the volume. Must be specified as <number><suffix>. Valid suffixes are 'seconds', 'minutes', 'hours', 'days', and 'years'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snaplock.LogConfigInfo

---

### Notes
Category: snaplock
API: snaplock-create-vserver-log
Family: vserver

---

### Syntax
```PowerShell
New-NcSnaplockLogConfig [[-Volume] <String>] [-MaxLogSize <String>] [-DefaultRetentionPeriod <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
