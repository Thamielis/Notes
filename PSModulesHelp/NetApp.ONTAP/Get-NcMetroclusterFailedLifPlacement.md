Get-NcMetroclusterFailedLifPlacement
------------------------------------

### Synopsis
Get a list of LIF placement failures in a MetroCluster setup.

---

### Description

Get a list of LIF placement failures in a MetroCluster setup.

---

### Related Links
* [Repair-NcMetroclusterLifPlacement](Repair-NcMetroclusterLifPlacement)

---

### Examples
> Example 1

```PowerShell
Get-NcMetroclusterFailedLifPlacement
Get the LIF placement failures.
```

---

### Parameters
#### **Vserver**
One or more sync source vserver names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|SyncSourceVserver|

#### **Interface**
One or more LIFs on the sync source vserver.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases                             |
|------------|--------|--------|---------------------|------------------------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Lif<br/>Vif<br/>SyncSourceVserverLif|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterShowLifPlacementFailures object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterFailedLifPlacement -Template" to get the initially empty MetroclusterShowLifPlacementFailures object.  If not specified, all data is returned for each object.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[MetroclusterShowLifPlacementFailures]`|false   |named   |false        |

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
Specify to get an empty MetroclusterShowLifPlacementFailures object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterShowLifPlacementFailures object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterFailedLifPlacement -Template" to get the initially empty MetroclusterShowLifPlacementFailures object.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[MetroclusterShowLifPlacementFailures]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterShowLifPlacementFailures

---

### Notes
Category: metrocluster
API: metrocluster-show-lif-placement-failures-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterFailedLifPlacement [[-Vserver] <String[]>] [[-Interface] <String[]>] [-Attributes <MetroclusterShowLifPlacementFailures>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterFailedLifPlacement -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterFailedLifPlacement -Query <MetroclusterShowLifPlacementFailures> [-Attributes <MetroclusterShowLifPlacementFailures>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
