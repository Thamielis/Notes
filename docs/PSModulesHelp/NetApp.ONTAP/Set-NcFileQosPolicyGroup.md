Set-NcFileQosPolicyGroup
------------------------

### Synopsis
Manage the association of QoS policy group to a specified file.

---

### Description

Manage the association of QoS policy group to a specified file.

QoS Policy groups define measurable Service Level Objectives (SLOs) that apply to the storage object with which the policy group is associated. in ONTAP 8.2 hierarchical QoS is not supported i.e. QoS policy groups cannot be assigned to multiple objects in the file's storage hierarchy - such as the parent LUN, volume or Vserver.

---

### Related Links
* [Get-NcFile](Get-NcFile)

---

### Examples
> Example 1

Set-NcFileQosPolicyGroup -Path cifs/hello.txt -Volume powershell -Vserver beam01 -QosPolicyGroup policy1
Set the QoS policy group for the given file.

Name                                     Type            Size      Created     Modified Owner Group   Perm Empty
----                                     ----            ----      -------     -------- ----- -----   ---- -----
hello.txt                                file            2 GB    6/10/2013    8/20/2013     0     0    777

---

### Parameters
#### **Path**
Relative path of the file without a trailing slash.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|File   |

#### **Volume**
Name of the Volume in which the file resides.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
Name of the Vserver in which the volume that hosts the file resides.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **QosPolicyGroup**
The QoS Policy Group Name that is to be associated with this file in order to enforce Service Level Objectives (SLO).
Use 'none' to delete the association of the file with a QoS policy group.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |4       |true (ByPropertyName)|QosPolicyGroupName|

#### **CachingPolicy**
The caching policy that is associated with this file. This policy is used to make caching decisions for this file. If a caching policy is not assigned to this file, the system uses the caching policy that is assigned to the containing volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **QosAdaptivePolicyGroupName**
The QoS adaptive policy group name that is to be associated with this file in order to enforce service level objectives (SLO).
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

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
* DataONTAP.C.Types.File.FileInfo

---

### Notes
Category: file
API: file-assign-qos
Family: cluster

---

### Syntax
```PowerShell
Set-NcFileQosPolicyGroup [-Path] <String> [-Volume] <String> [-Vserver] <String> [[-QosPolicyGroup] <String>] [[-CachingPolicy] <String>] [[-QosAdaptivePolicyGroupName] <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
