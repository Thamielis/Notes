Set-NcVolSize
-------------

### Synopsis
Set the size of a volume.

---

### Description

Set the size of a volume.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcVolSize](Get-NcVolSize)

---

### Examples
> Example 1

Set-NcVolSize vol2 +1g
Increase the size of volume 'vol2' by one GB.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   11.0 GB   5%   10.4 GB False  aggr1     vserver1

---

### Parameters
#### **Name**
The name of the volume to modify.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **NewSize**
The new size of the volume.
Specify the new size using the following format:
[+|-]<number>[k|m|g|t|%]
If a leading '+' or '-' appears, it indicates that the volume size is to be increased or decreased (respectively) by the indicated amount, else the amount is the absolute size to set.
The optional trailing '%', which must be accompanied by a leading '+' or '-', indicates that the volume size is to be increased or decreased in proportion to the current size.
The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired.
The file system size of a readonly replica flexible volume, such as a snapmirror destination, is determined from the replica source.  In such cases, the value set using Set-NcVolSize is interpreted as an upper limit on the size.  A flexible volume that's not a readonly replica which has the "fs_size_fixed" option set may have its size displayed, but not changed.  Attempting to set the volume size in this case will result in failure.  Users must be able to adjust readonly replica flexible volume size in order to maintain enough capacity to accommodate transfers from the replica source.  Attempting to set a readonly replica destination size to be less than that of its source will result in a failure.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |2       |false        |Size   |

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
Category: volume
API: volume-size, volume-size-async
Family: vserver

---

### Syntax
```PowerShell
Set-NcVolSize [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-NewSize] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVolSize [-Name] <String> -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-NewSize] <String> [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
