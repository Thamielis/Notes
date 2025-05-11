Set-NcSnaplockRetentionTime
---------------------------

### Synopsis
Set retention period on a file.

---

### Description

Set retention period on a file.

User can specify either retention-time or set-infinite-retention. If neither the retention-time nor set-infinite-retention is specified, the file will get committed to worm with default retention-period.

---

### Related Links
* [Get-NcSnaplockRetentionTime](Get-NcSnaplockRetentionTime)

---

### Examples
> Example 1

Set-NcSnaplockRetentionTime -File /vol/locked/test.snaplock -RetentionTime $dt -VserverContext primary1
Set the Retention Time on a file using a DateTime object, which obtained as $dt = [datetime]"12/4/15"

Vserver                        File Path                                                                  RetentionTime
-------                        ---------                                                                  -------------

primary1                       /vol/locked/test.snaplock                                          12/4/2015 12:00:00 AM

---

### Parameters
#### **File**
Absolute path of the file. The value begins /vol/<volumename>.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>PathName|

#### **RetentionTime**
Time till which the file must be retained (input as a DateTime object). Use the SetInfiniteRetention parameter to set retention time to infinite

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|true    |2       |true (ByPropertyName)|

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

#### **SetInfiniteRetention**
Specify to set the file retention period to infinite retention

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snaplock.SnaplockFileRetentionInfo

---

### Notes
Category: snaplock
API: snaplock-set-file-retention
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnaplockRetentionTime [-File] <String> [-RetentionTime] <DateTime> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSnaplockRetentionTime [-File] <String> -SetInfiniteRetention [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
