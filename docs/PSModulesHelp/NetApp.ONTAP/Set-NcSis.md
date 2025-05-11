Set-NcSis
---------

### Synopsis
Set up or modify SIS (dedupe) policy, schedule or options for a volume.

---

### Description

Set up or modify SIS (dedupe) policy, schedule or options for a volume.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcSis](Get-NcSis)

* [Get-NcSisPolicy](Get-NcSisPolicy)

---

### Examples
> Example 1

Set-NcSis testvol2 -Schedule "mon-fri@0,12" -Compression $false | Get-NcSis
Set dedupe to run Monday through Friday at noon and midnight on the volume 'testvol2'.  Also disable compression on this volume.

Path          State   Status ScheduleOrPolicy Progress
----          -----   ------ ---------------- --------
/vol/testvol2 enabled idle   mon-fri@0,12     Idle for 00:39:51

---

### Parameters
#### **Name**
The volume on which to configure SIS operations.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Path<br/>Volume|

#### **Schedule**
The schedule string for the SIS operation.
The format of the schedule: day_list[@hour_list] or hour_list[@day_list] or "-" or "auto".
The day_list specifies which days of the week the SIS operation should run.  It is a comma-separated list of the first three letters of the day: sun, mon, tue, wed, thu, fri, sat.  The names are not case sensitive.  Day ranges such as mon-fri can also be given.  The default day_list is sun-sat.
The hour_list specifies which hours of the day the SIS operation should run on each scheduled day.  The hour_list is a comma-separated list of the integers from 0 to 23.  Hour ranges such as 8-17 are allowed.  Step values can be used in conjunction with ranges.  For example, 0-23/2 means "every two hours".  The default hour_list is 0, i.e. midnight on the morning of each scheduled day.
If "-" is specified, no schedule is set.
A policy name and schedule must not be specified together in the same call.  If schedule is passed, any previous policy name set on the volume is automatically reset.
The "auto" schedule string means the SIS operation will be triggered by the amount of new data written to the volume.  The criterion is subject to being changed later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Policy**
The SIS policy name to be attached to the volume.  The policy name will determine SIS policy will trigger the scheduled SIS operations.  Policy and Schedule must not be specified together in the same API call.  If Policy is specified, any previous schedule set on the volume is automatically reset.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Compression**
If true, compression will be enabled on the SIS volume.  If false, compression will be disabled on the volume.  If the value is not specified the compression state will be unchanged.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **InlineCompression**
If true, inline compression will be enabled on the SIS volume.  If false, inline compression will be disabled on the volume.  If the value is not specified, the inline compression state will be unchanged.  To enable inline compression, compression must be enabled either in this call or by a previous call to Set-NcSis.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EnableIdd**
Enables file level incompressible data detection and quick check incompressible data detection for large files.  This is per volume option. Once this set to true, inline compression will do a 4k compression quick check for large files before proceeding with full CG compression. If quick check finds a 4k within a CG as incompressible, inline compression won't attempt to compress the CG. And the blocks are written in uncompressed form to disk. Also once this is enabled, if inline compression encounters a incompressible CG within small files, it will mark the file with do not compress flag. As long as this flag is set on a small file, inline compression won't attempt further compression on the file.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **QuickCheckFileSize**
Quick check file size for Incompressible Data Detection. If Incompressible data detection is enabled and if the file size is >= QuickCheckFileSize, inline compression will do a 4k quick check before doing full CG compression.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CompressionType**
Specifies the compression type on the volume. Possible values: 'adaptive', 'secondary'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EnableDataCompaction**
Enable data compaction on the sis volume.
If set to true, data-compaction will be enabled on the volume. If set to false, data-compaction will be disabled on the volume. If the value is not specified, data-compaction state will be unchanged.
This parameter is available in ONTAP 9.0 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EnableInlineDedupe**
Enable inline deduplication on the sis volume.
If set to true, inline-deduplication will be enabled on the sis volume. If set to false, inline-deduplication will be disabled on the volume. If the value is not specified, inline-deduplication state will be unchanged.
This parameter is available in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EnableCrossVolumeInlineDedupe**
Enable inline deduplication on the sis volume.
This parameter is available in ONTAP 9.2 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EnableCrossVolumeBackgroundDedupe**
Enable cross volume background deduplication on the sis volume. If true, cross volume background deduplication will be enabled on the sis volume. If false, cross volume background deduplication will be disabled on the volume. If the value is not specified, cross volume background deduplication state will be unchanged.
This parameter is available in ONTAP 9.3 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ApplicationIoSize**
Adaptive compression allows different compression settings on the volume based on possible IO sizes the volume can have. The larger the volume's IO size, the better the compression savings will be. If application IO size is larger than 32K, one should pass 32K as compression caps its setting to max 32K value.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CompressionAlgorithm**
Specifies the compression algorithm on volume with secondary compression.
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

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
API: sis-set-config, sis-set-config-async
Family: vserver

---

### Syntax
```PowerShell
Set-NcSis [-Name] <String> [-Schedule <String>] [-Policy <String>] [-Compression <Boolean>] [-InlineCompression <Boolean>] [-EnableIdd <Boolean>] [-QuickCheckFileSize <String>] 
```
```PowerShell
[-CompressionType <String>] [-EnableDataCompaction <Boolean>] [-EnableInlineDedupe <Boolean>] [-EnableCrossVolumeInlineDedupe <Boolean>] [-EnableCrossVolumeBackgroundDedupe <Boolean>] 
```
```PowerShell
[-ApplicationIoSize <String>] [-CompressionAlgorithm <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSis [-Name] <String> [-Schedule <String>] [-Policy <String>] [-Compression <Boolean>] [-InlineCompression <Boolean>] -InfiniteVolume [-EnableIdd <Boolean>] [-QuickCheckFileSize 
```
```PowerShell
<String>] [-CompressionType <String>] [-EnableDataCompaction <Boolean>] [-EnableInlineDedupe <Boolean>] [-EnableCrossVolumeInlineDedupe <Boolean>] [-EnableCrossVolumeBackgroundDedupe 
```
```PowerShell
<Boolean>] [-ApplicationIoSize <String>] [-CompressionAlgorithm <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
