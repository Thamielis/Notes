Invoke-NcMetroclusterCheck
--------------------------

### Synopsis
Invoke a check on the MetroCluster configuration.

---

### Description

Invoke a check on the MetroCluster configuration.

---

### Related Links
* [Get-NcMetroclusterAggregateCheck](Get-NcMetroclusterAggregateCheck)

* [Get-NcMetroclusterAggregateEligibilityCheck](Get-NcMetroclusterAggregateEligibilityCheck)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

* [Get-NcMetroclusterCheck](Get-NcMetroclusterCheck)

---

### Examples
> Example 1

```PowerShell
Invoke-NcMetroClusterCheck
Run the MetroCluster check operation on the current MetroCluster configuration.
```

---

### Parameters
#### **StartOnNodeAndSkipNodeVersionChecks**
Specify on which Node job starts and skip Node Version checks

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|Node<br/>NodeName|

#### **SkipDrSimulation**
Specify to skip switchover and switchback simulations.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
* 

---

### Notes
Category: metrocluster
API: metrocluster-check-run
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcMetroclusterCheck [-StartOnNodeAndSkipNodeVersionChecks <String>] [-SkipDrSimulation] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
