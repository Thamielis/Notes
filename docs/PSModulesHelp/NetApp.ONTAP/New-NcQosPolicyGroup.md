New-NcQosPolicyGroup
--------------------

### Synopsis
Create a policy group.

---

### Description

Create a policy group.  A unique name must be provided for the new policy group. A QoS Policy group defines measurable Service Level Objectives (SLOs) that apply to the storage object with which the policy group is associated.

---

### Related Links
* [Get-NcQosPolicyGroup](Get-NcQosPolicyGroup)

* [Set-NcQosPolicyGroup](Set-NcQosPolicyGroup)

* [Remove-NcQosPolicyGroup](Remove-NcQosPolicyGroup)

* [Update-NcQosPolicyGroup](Update-NcQosPolicyGroup)

---

### Examples
> Example 1

New-NcQosPolicyGroup -Name policy1 -Vserver dummy
Create the policy group named policy1 on vserver dummy.

PolicyGroup                                          MaxThroughput PolicyGroupClass     Vserver
-----------                                          ------------- ----------------     -------
policy1                                                        INF user_defined         dummy

---

### Parameters
#### **Name**
Name of the policy group. Policy group names must be unique and are restricted to 128 alphanumeric characters, '-', and '_', and must start with an alphanumeric character (a-z, A-Z, or 0-9).

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyGroup|

#### **Vserver**
The Data Vserver to which the policy group belongs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MaxThroughput**
Maximum throughput defined by this policy.  It is specified in terms of IOPS or MB/s, and the range is zero to infinity. The values entered here are case-insensitive, and the units are base ten. There should be no space between the number and the units.  The default value for max-throughput is infinity. The default unit is IOPS. Two reserved keywords, 'none' and 'INF', are available for the situation that requires removal of a value, and the situation that needs to specify the maximum available value.  
Examples of valid specifications are: 100B/s, 10KB/s, 1gb/s, 500MB/s, 1tb/s, and 100iops.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **MinThroughput**
Minimum throughput defined by this policy.
This parameter is available in ONTAP 9.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsShared**
Policy group shared state. Default: true.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |1       |true (ByPropertyName)|

#### **MaxThroughputMbps**
Maximum throughput defined by this policy. It is specified in terms of Mbps. 0 means no maximum throughput is enforced. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MinThroughputMbps**
Minimum throughput defined by this policy. It is specified in terms of Mbps. 0 means no minimum throughput is enforced. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosPolicyGroupInfo

---

### Notes
Category: qos
API: qos-policy-group-create
Family: cluster

---

### Syntax
```PowerShell
New-NcQosPolicyGroup [-Name] <String> [-Vserver] <String> [[-MaxThroughput] <String>] [-MinThroughput <String>] [[-IsShared] <Boolean>] [-MaxThroughputMbps <String>] [-MinThroughputMbps 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
