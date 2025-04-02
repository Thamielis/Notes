Get-NcQosPolicyReadAhead
------------------------

### Synopsis
Get a list of read-ahead policies.

---

### Description

Get a list of read-ahead policies.

---

### Related Links
* [New-NcQosPolicyReadAhead](New-NcQosPolicyReadAhead)

* [Remove-NcQosPolicyReadAhead](Remove-NcQosPolicyReadAhead)

* [Set-NcQosPolicyReadAhead](Set-NcQosPolicyReadAhead)

* [Update-NcQosPolicyReadAhead](Update-NcQosPolicyReadAhead)

---

### Examples
> Example 1

```PowerShell
Get-NcQosPolicyReadAhead -Name Standard
Get the quality of service read ahead policy named "standard"

ReadAheadPolicyName : Standard
ReadAheadClass      : preset
AlignBlocks         : 64
Default             : True
DiskResponseFactor  : 3
DiskResponseWeight  : 80
EarlyCount          : 10
ForceDump           : False
ForceFull           : False
ForceNone           : False
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
Overshoot           : 20
SmallfileBlocks     : 16
UseAsync            : True
UseFeedback         : True
UseTiming           : True

```
> Example 2

```PowerShell
$q = Get-NcQosPolicyReadAhead -Template
$q.Overshoot = ">50"
Get-NcQosPolicyReadAhead -Query $q
Get all of the read ahead policies with an Overshoot value that is greater than 50%.

ReadAheadPolicyName : Sequential
ReadAheadClass      : preset
AlignBlocks         : 64
Default             : False
DiskResponseFactor  : 3
DiskResponseWeight  : 80
EarlyCount          : 10
ForceDump           : False
ForceFull           : False
ForceNone           : False
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
Overshoot           : 100
SmallfileBlocks     : 16
UseAsync            : True
UseFeedback         : True
UseTiming           : True

```

---

### Parameters
#### **Name**
The read ahead policy name(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                                     |
|------------|--------|--------|---------------------|--------------------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ReadAheadPolicyName<br/>ReadAheadSettingName|

#### **Attributes**
For improved scalability in large clusters, provide a QosPolicyReadAheadInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQosPolicyReadAhead -Template" to get the initially empty QosPolicyReadAheadInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[QosSettingsReadAheadInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty QosPolicyReadAheadInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosPolicyReadAheadInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosPolicyReadAhead -Template" to get the initially empty QosPolicyReadAheadInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[QosSettingsReadAheadInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosSettingsReadAheadInfo

---

### Notes
Category: qos
API: qos-policy-read-ahead-get-iter,qos-settings-read-ahead-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosPolicyReadAhead [[-Name] <String[]>] [-Attributes <QosSettingsReadAheadInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosPolicyReadAhead -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosPolicyReadAhead -Query <QosSettingsReadAheadInfo> [-Attributes <QosSettingsReadAheadInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
