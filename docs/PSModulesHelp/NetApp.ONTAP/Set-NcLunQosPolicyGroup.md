Set-NcLunQosPolicyGroup
-----------------------

### Synopsis
Set the QoS policy group for a LUN.

---

### Description

Set the QoS policy group for a LUN.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

Set-NcLunQosPolicyGroup /vol/luns/disk0 -QosPolicyGroup policy1
Set the QoS policy group for /vol/luns/disk0.

Path                                           Size Protocol     Online Mapped  Thin  Vserver              Comment
----                                           ---- --------     ------ ------  ----  -------              -------
/vol/luns/disk0                            100.0 GB windows_2008  True  False   True  beam01

---

### Parameters
#### **Path**
Path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **QosPolicyGroup**
QoS Policy Group for the LUN. Setting this value to 'none' removes the LUN from a policy group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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

#### **QosAdaptivePolicyGroup**
QoS adaptive policy group defines measurable Service Level Objectives (SLOs) that adjust based on the LUN's allocated space or used space.
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **None**
If specified, the LUN will be removed from the QoS policy group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-set-qos-policy-group
Family: vserver

---

### Syntax
```PowerShell
Set-NcLunQosPolicyGroup [-Path] <String> [-QosPolicyGroup] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcLunQosPolicyGroup [-Path] <String> [-QosAdaptivePolicyGroup] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcLunQosPolicyGroup [-Path] <String> [-None] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
