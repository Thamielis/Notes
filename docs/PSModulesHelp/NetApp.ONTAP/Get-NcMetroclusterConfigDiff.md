Get-NcMetroclusterConfigDiff
----------------------------

### Synopsis
Get the differences in configuration between two clusters in DR relationship for MetroCluster.

---

### Description

Get the differences in configuration between two clusters in DR relationship for MetroCluster. If an object is not specified, the differences for all replicated objects are shown. If the source configuration matches that of the destination, EOBJECTNOTFOUND is returned, indicating that the difference is nil. This cmdlet can be invoked on the source cluster or destination cluster.  

Note: The configuration objects replicated as part of MetroCluster and their keys can potentially change from release to release. If a program has opted to use those as inputs for selection, it may have to be adjusted for updated versions of Data ONTAP.

---

### Related Links
* [Get-NcMetrocluster](Get-NcMetrocluster)

---

### Examples
> Example 1

```PowerShell
Get-NcMetroclusterConfigDiff
Get the differences in the configuration between two clusters in MetroCluster relationship.
```

---

### Parameters
#### **SourceCluster**
One or more source clusters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|SourceClusterName|

#### **DestinationCluster**
One or more destination clusters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|DestinationClusterName|

#### **Object**
One or more cluster-domain objects being compared.  For example: 'aggrView'.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Instance**
The count of object instance.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |named   |true (ByPropertyName)|

#### **Keys**
One or more key:value pairs of the specific configuration instance compared.  For example: 'volume:vol1'.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ConfigClusterDiffInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterConfigDiff -Template" to get the initially empty ConfigClusterDiffInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ConfigClusterDiffInfo]`|false   |named   |false        |

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
Specify to get an empty ConfigClusterDiffInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ConfigClusterDiffInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterConfigDiff -Template" to get the initially empty ConfigClusterDiffInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ConfigClusterDiffInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.ConfigClusterDiffInfo

---

### Notes
Category: metrocluster
API: metrocluster-config-diff-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterConfigDiff [[-SourceCluster] <String[]>] [[-DestinationCluster] <String[]>] [-Object <String[]>] [-Instance <UInt64[]>] [-Keys <String[]>] [-Attributes 
```
```PowerShell
<ConfigClusterDiffInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterConfigDiff -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterConfigDiff -Query <ConfigClusterDiffInfo> [-Attributes <ConfigClusterDiffInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
