Get-NcSnaplockRetentionTime
---------------------------

### Synopsis
Get retention period of a worm file.

---

### Description

Get retention period of a worm file.

---

### Related Links
* [Set-NcSnaplockRetentionTime](Set-NcSnaplockRetentionTime)

---

### Examples
> Example 1

Get-NcSnaplockRetentionTime -File /vol/locked/test.snaplock -VserverContext primary1
Get the retention time of the file /vol/locked/test.snaplock

Vserver                        File Path                                                                  RetentionTime
-------                        ---------                                                                  -------------

primary1                       /vol/locked/test.snaplock                                          12/4/2015 12:00:00 AM

---

### Parameters
#### **File**
Absolute path of the file. The value begins  /vol/<volumename>

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>PathName|

#### **DesiredAttributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                         |Required|Position|PipelineInput        |Aliases   |
|-----------------------------|--------|--------|---------------------|----------|
|`[SnaplockFileRetentionInfo]`|false   |2       |true (ByPropertyName)|Attributes|

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
* DataONTAP.C.Types.Snaplock.SnaplockFileRetentionInfo

---

### Notes
Category: snaplock
API: snaplock-get-file-retention
Family: vserver

---

### Syntax
```PowerShell
Get-NcSnaplockRetentionTime [-File] <String> [[-DesiredAttributes] <SnaplockFileRetentionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
