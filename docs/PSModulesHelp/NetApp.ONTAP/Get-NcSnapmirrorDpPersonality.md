Get-NcSnapmirrorDpPersonality
-----------------------------

### Synopsis
This cmdlet returns the Data Protection Personality (DP Personality) of the cluster.

---

### Description

This cmdlet returns the Data Protection Personality (DP Personality) of the cluster.

---

### Examples
> Example 1

Get-NcSnapmirrorDpPersonality
It returns the Data Protection Personality (DP Personality) of the cluster.

isDpPersonality   NcController                                           isDpPersonalitySpecified
 ---------------   ------------                                           ------------------------
 False             10.140.111.42                                           True

---

### Parameters
#### **DesiredAttributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                           |Required|Position|PipelineInput        |
|-------------------------------|--------|--------|---------------------|
|`[SnapmirrorDpPersonalityInfo]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.Snapmirror.SnapmirrorDpPersonalityInfo

---

### Notes
Category: snapmirror
API: snapmirror-get-dp-personality
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirrorDpPersonality [-DesiredAttributes <SnapmirrorDpPersonalityInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
