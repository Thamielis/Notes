Set-NcQosPolicyGroup
--------------------

### Synopsis
Modify an existing QoS policy group.

---

### Description

Modify an existing QoS policy group.

---

### Related Links
* [Get-NcQosPolicyGroup](Get-NcQosPolicyGroup)

* [New-NcQosPolicyGroup](New-NcQosPolicyGroup)

* [Remove-NcQosPolicyGroup](Remove-NcQosPolicyGroup)

* [Update-NcQosPolicyGroup](Update-NcQosPolicyGroup)

---

### Examples
> Example 1

Set-NcQosPolicyGroup -Name policy2 -MaxThroughput 20mb/s
Set the MaxThroughput for QoS policy group policy2 to 20MB/s.

PolicyGroup                                          MaxThroughput PolicyGroupClass     Vserver
-----------                                          ------------- ----------------     -------
policy2                                                     20MB/S user_defined         dummy

---

### Parameters
#### **Name**
Name of the policy group. Policy group names must be unique and are restricted to 128 alphanumeric characters, '-', and '_', and must start with an alphanumeric character (a-z, A-Z, or 0-9).

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyGroup|

#### **MaxThroughput**
Maximum throughput defined by this policy.  It is specified in terms of IOPS or MB/s, and the range is zero to infinity. The values entered here are case-insensitive, and the units are base ten. There should be no space between the number and the units.  The default value for max-throughput is infinity. The default unit is IOPS. Two reserved keywords, 'none' and 'INF', are available for the situation that requires removal of a value, and the situation that needs to specify the maximum available value. 
Examples of valid specifications are: 100B/s, 10KB/s, 1gb/s, 500MB/s, 1tb/s, and 100iops.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **MinThroughput**
Minimum throughput defined by this policy.
This parameter is available in ONTAP 9.2 and later.

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
API: qos-policy-group-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosPolicyGroup [-Name] <String> [[-MaxThroughput] <String>] [-MinThroughput <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
