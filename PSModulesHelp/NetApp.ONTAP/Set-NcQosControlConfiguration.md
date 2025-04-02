Set-NcQosControlConfiguration
-----------------------------

### Synopsis
Modify the existing cluster-wide QoS control settings.

---

### Description

Modify the existing cluster-wide QoS control settings.

---

### Related Links
* [Get-NcQosControlConfiguration](Get-NcQosControlConfiguration)

---

### Examples
> Example 1

```PowerShell
Set-NcQosControlConfiguration -Enforcement $false -RatebucketRebalance $true
Set the cluster QoS control settings.

Enforcement                  : False
NcController                 : 10.63.165.62
RatebucketRebalance          : True

```

---

### Parameters
#### **Enforcement**
Cluster-wide QoS enforcement setting.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |1       |true (ByPropertyName)|

#### **RatebucketRebalance**
Manage QoS ratebucket budgets across the cluster.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |2       |true (ByPropertyName)|

#### **PolicyDeactivation**
Deactivation of QoS policies on lower priority policy groups.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosSettingsControlInfo

---

### Notes
Category: qos
API: qos-settings-control-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosControlConfiguration [[-Enforcement] <Boolean>] [[-RatebucketRebalance] <Boolean>] [-PolicyDeactivation <Boolean>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
