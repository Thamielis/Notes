Repair-NcMetroclusterLifPlacement
---------------------------------

### Synopsis
Verify LIF placement in the destination cluster for the sync-source Vserver LIF in a MetroCluster setup.

---

### Description

Verify LIF placement in the destination cluster for the sync-source Vserver LIF in a MetroCluster setup.

---

### Related Links
* [Get-NcMetroclusterFailedLifPlacement](Get-NcMetroclusterFailedLifPlacement)

---

### Examples
> Example 1

```PowerShell
Repair-NcMetroclusterLifPlacement -Vserver beam01 -Lif beam01_cifs
Repair the LIF placement of the "beam01_cifs" lif on Vserver "beam01".
```

---

### Parameters
#### **Vserver**
Source Vserver in metrocluster configuration.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Lif**
Source Vserver LIF.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

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
API: metrocluster-check-lif-repair-placement
Family: cluster

---

### Syntax
```PowerShell
Repair-NcMetroclusterLifPlacement [-Vserver] <String> [[-Lif] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
