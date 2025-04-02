Set-NcQosPolicyReadAhead
------------------------

### Synopsis
Modify a read-ahead policy.

---

### Description

Modify a read-ahead policy.

---

### Related Links
* [Get-NcQosPolicyReadAhead](Get-NcQosPolicyReadAhead)

* [New-NcQosPolicyReadAhead](New-NcQosPolicyReadAhead)

* [Remove-NcQosPolicyReadAhead](Remove-NcQosPolicyReadAhead)

* [Update-NcQosPolicyReadAhead](Update-NcQosPolicyReadAhead)

---

### Examples
> Example 1

```PowerShell
Set-NcQosPolicyReadAhead test -ForceNone:$true -Overshoot 30
Set some properties on the given quality of service read ahead policy.

ReadAheadPolicyName : test
ReadAheadClass      : user_defined
AlignBlocks         : 64
Default             : False
DiskResponseFactor  : 3
DiskResponseWeight  : 80
EarlyCount          : 10
ForceDump           : False
ForceFull           : False
ForceNone           : True
InterarrivalWeight  : 80
Jitter              : 80
MaxBlocks           : 192
MaxDeadline         : 1000000
MaxDiskResponseTime : 50000
MaxGap              : 1024
MetadataBlocks      : 64
MinBlocks           : 128
MinDiskResponseTime : 1000
MinRange            : 3840
Overshoot           : 30
SmallfileBlocks     : 16
UseAsync            : True
UseFeedback         : True
UseTiming           : True

```

---

### Parameters
#### **Name**
Name of QoS read ahead policy.

|Type      |Required|Position|PipelineInput        |Aliases                                     |
|----------|--------|--------|---------------------|--------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ReadAheadPolicyName<br/>ReadAheadSettingName|

#### **AlignBlocks**
Block Alignment

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Default**
Default

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DiskResponseFactor**
Disk Response Time Factor

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **DiskResponseWeight**
Weight for Disk Response Time Aging (%)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **EarlyCount**
Number of IO Operations Cautiously Predicted

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ForceDump**
Force DUMP-Style Readahead

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ForceFull**
Force Full-File Readahead

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ForceNone**
Disable Readahead

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **InterarrivalWeight**
Weight for Interarrival Time Aging (%)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Jitter**
Threshold for Detecting Jitter (%)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxBlocks**
Maximum Blocks to Speculate

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxDeadline**
Maximum Deadline Offset (us)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxDiskResponseTime**
Maximum Disk Response Time (us)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxGap**
Maximum Speculative Blocks Outstanding

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxRange**
Maximum Range Used When Aging Streams (Blocks)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MetadataBlocks**
Minimum Blocks for Which Metadata is Predicted

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinBlocks**
Minimum Blocks to Speculate

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinDiskResponseTime**
Minimum Disk Response Time (us)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinRange**
Minimum Range Used When Aging Streams (Blocks)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Overshoot**
Allowable Overshoot (%)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **SmallfileBlocks**
Maximum Blocks for Small-File Handling

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UseAsync**
Use Asynchronous Speculation

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **UseFeedback**
Provide Cache-Miss Feedback

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **UseTiming**
Use Timing Algorithms

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MinRetireTime**
Minimum Time Before a Stream is Retired (us)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxRetireTime**
Maximum Time Before a Stream is Retired (us)

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UseHistogram**
If true, use Histogram-based predictions.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MinFileHistogram**
Minimum filesize for Histogram-based predictions (blocks). Range: [8192..33554432].

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosPolicyReadAheadInfo

---

### Notes
Category: qos
API: qos-policy-read-ahead-modify,qos-settings-read-ahead-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosPolicyReadAhead [-Name] <String> [-AlignBlocks <Int32>] [-Default <Boolean>] [-DiskResponseFactor <Int32>] [-DiskResponseWeight <Int32>] [-EarlyCount <Int32>] [-ForceDump <Boolean>] 
```
```PowerShell
[-ForceFull <Boolean>] [-ForceNone <Boolean>] [-InterarrivalWeight <Int32>] [-Jitter <Int32>] [-MaxBlocks <Int32>] [-MaxDeadline <Int32>] [-MaxDiskResponseTime <Int32>] [-MaxGap <Int32>] 
```
```PowerShell
[-MaxRange <Int32>] [-MetadataBlocks <Int32>] [-MinBlocks <Int32>] [-MinDiskResponseTime <Int32>] [-MinRange <Int32>] [-Overshoot <Int32>] [-SmallfileBlocks <Int32>] [-UseAsync <Boolean>] 
```
```PowerShell
[-UseFeedback <Boolean>] [-UseTiming <Boolean>] [-MinRetireTime <Int32>] [-MaxRetireTime <Int32>] [-UseHistogram <Boolean>] [-MinFileHistogram <Int32>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
