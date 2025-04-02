New-NcQosPolicyReadAhead
------------------------

### Synopsis
Create a new read ahead policy.

---

### Description

Create a new read ahead policy.  A unique name must be provided for the new read-ahead policy. If the 'default' field is set to true, these become the default read-ahead settings for policies that don't otherwise name read-ahead settings.  Unless creating a new default, creating read-ahead policies should usually be assigned to an existing QoS policy.

---

### Related Links
* [Get-NcQosPolicyReadAhead](Get-NcQosPolicyReadAhead)

* [Set-NcQosPolicyReadAhead](Set-NcQosPolicyReadAhead)

* [Update-NcQosPolicyReadAhead](Update-NcQosPolicyReadAhead)

* [Remove-NcQosPolicyReadAhead](Remove-NcQosPolicyReadAhead)

---

### Examples
> Example 1

```PowerShell
New-NcQosPolicyReadAhead -Name test-policy
Create a read ahead policy with the name test-policy and default settings.

ReadAheadPolicyName : test-policy
ReadAheadClass      : user_defined
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
Overshoot           : 20
SmallfileBlocks     : 16
UseAsync            : True
UseFeedback         : True
UseTiming           : True

```
> Example 2

```PowerShell
$a = Get-NcQosPolicyReadAhead -Template
$a.ReadAheadPolicyName = "test-policy"
$a.Overshoot = "75"
$a.ForceDump = $true
New-NcQosPolicyReadAhead -Attributes $a
Create a new read ahead policy with the given settings.  Any settings not specified will have default values.

ReadAheadPolicyName : test-policy
ReadAheadClass      : user_defined
AlignBlocks         : 64
Default             : False
DiskResponseFactor  : 3
DiskResponseWeight  : 80
EarlyCount          : 10
ForceDump           : True
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
Overshoot           : 75
SmallfileBlocks     : 16
UseAsync            : True
UseFeedback         : True
UseTiming           : True

```

---

### Parameters
#### **Name**
Name of the quality of service read ahead policy to create.  A policy with the default settings will be created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **Attributes**
A QosPolicyReadAheadInfo object containing the initial settings to give the created read ahead policy.  Use "Get-NcQosPolicyReadAhead -Template" to get the initially empty QosPolicyReadAheadInfo.  The ReadAheadPolicyName attribute must be set or the command will fail.

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
API: qos-policy-read-ahead-create,qos-settings-read-ahead-create
Family: cluster

---

### Syntax
```PowerShell
New-NcQosPolicyReadAhead [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
New-NcQosPolicyReadAhead -Attributes <QosSettingsReadAheadInfo> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
