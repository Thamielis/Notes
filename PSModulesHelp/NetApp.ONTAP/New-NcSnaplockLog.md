New-NcSnaplockLog
-----------------

### Synopsis
Archive the active worm log file and open a new log file for future updates

---

### Description

This will close the current log file for furthur updates and it will open a new log file to write  future log updates

A job is spawned and the job id  will be returned. The progress of the job can be tracked using the Get-NcJob cmdlet.

---

### Related Links
* [Get-NcSnaplockLogFiles](Get-NcSnaplockLogFiles)

---

### Examples
> Example 1

```PowerShell
New-NcSnaplockLog -VserverContext primary1
Archive the SnapLock log for primary1 vserver

NcController : 10.63.1.234
ErrorCode    : 
ErrorMessage : 
JobId        : 2394
JobVserver   : 
Status       : in_progress

```

---

### Parameters
#### **BaseName**
Base name of the WORM log files to archive.  If not specified, all active WORM log files are archived.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |1       |true (ByPropertyName)|LogBasename|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: snaplock
API: snaplock-archive-vserver-log
Family: vserver

---

### Syntax
```PowerShell
New-NcSnaplockLog [[-BaseName] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
