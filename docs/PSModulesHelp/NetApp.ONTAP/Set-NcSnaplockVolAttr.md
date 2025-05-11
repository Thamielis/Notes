Set-NcSnaplockVolAttr
---------------------

### Synopsis
Sets the given snaplock attributes of a snaplock volume.

---

### Description

Sets the given snaplock attributes of a snaplock volume.

---

### Related Links
* [Get-NcSnaplockVolAttr](Get-NcSnaplockVolAttr)

---

### Examples
> Example 1

```PowerShell
Set-NcSnaplockVolAttr -Volume locked -MaximumRetentionPeriod "31 years" -VserverContext primary1
Set the MaximumRetentionPeriod to 31 years on primary1:locked

AutocommitPeriod       : none
DefaultRetentionPeriod : max
MaximumRetentionPeriod : 31 years
MinimumRetentionPeriod : 0 years
NcController           : 10.63.1.234
PrivilegedDeleteState  : disallowed
Type                   : compliance
VolumeComplianceClock  : DataONTAP.C.Types.Snaplock.ComplianceClockInfo
VolumeExpiryTime       : none

```

---

### Parameters
#### **Volume**
Name of the snaplock volume whose attributes are to be set.

|Type      |Required|Position|PipelineInput        |Aliases                                |
|----------|--------|--------|---------------------|---------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Vol<br/>VolName<br/>VolumeName<br/>Name|

#### **MinimumRetentionPeriod**
Specifies the allowed minimum retention period for files to be committed to WORM state on the volume. Must be specified as <number><suffix>. Valid suffixes are 'seconds', 'minutes', 'hours', 'days', and 'years'"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DefaultRetentionPeriod**
Specifies the default retention period that will be applied to files when committed to WORM state if files has no explicit retention retention time set. Can be set to 'min', 'max', 'infinite' or a specific time in <number><suffix> format

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MaximumRetentionPeriod**
Specifies the allowed minimum retention period for files to be committed to WORM state on the volume. Must be specified as <number><suffix>. Valid suffixes are 'seconds', 'minutes', 'hours', 'days', and 'years'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AutocommitPeriod**
Specifies the autocommit-period for the snaplock volume; any file unmodified for greater than this period will be committed to WORM state. Can be specified as <number><suffix>.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsVolumeAppendModeEnabled**
Specifies if the volume append mode must be enabled or disabled.
 
 This parameter is available in ONTAP 9.3 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Snaplock.SnaplockAttrsInfo

---

### Notes
Category: snaplock
API: volume-set-snaplock-attrs
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnaplockVolAttr [-Volume] <String> [-MinimumRetentionPeriod <String>] [-DefaultRetentionPeriod <String>] [-MaximumRetentionPeriod <String>] [-AutocommitPeriod <String>] 
```
```PowerShell
[-IsVolumeAppendModeEnabled <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
