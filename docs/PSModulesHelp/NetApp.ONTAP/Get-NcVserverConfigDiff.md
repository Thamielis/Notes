Get-NcVserverConfigDiff
-----------------------

### Synopsis
Get the differences in configuration between Vservers in DR relationship, including MetroCluster.

---

### Description

Get the differences in configuration between Vservers in DR relationship, including MetroCluster. If an object is not specified, the differences for all replicated objects are shown.

This API helps in verifying if the configuration of interest is replicated correctly from source Vserver to destination Vserver. If the source configuration matches that of destination, EOBJECTNOTFOUND is returned, indicating that the difference is nil. This API can be invoked on the source cluster or destination cluster.

Note: The configuration objects replicated as part of Vserver DR and their keys can potentially change from release to release. If a program has opted to use those as inputs for selection, it may have to be adjusted for updated versions of Data ONTAP.

---

### Parameters
#### **SourceVserver**
The name of one or more source vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **DestinationVserver**
The name of one or more destination vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Object**
One of more configuration items being compared.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ConfigDiffInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVserverConfigDiff -Template" to get the initially empty ConfigDiffInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ConfigDiffInfo]`|false   |named   |false        |

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
Specify to get an empty ConfigDiffInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ConfigDiffInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserverConfigDiff -Template" to get the initially empty ConfigDiffInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ConfigDiffInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.ConfigDiffInfo

---

### Notes
Category: vserver
API: vserver-config-diff-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcVserverConfigDiff [[-SourceVserver] <String[]>] [[-DestinationVserver] <String[]>] [[-Object] <String[]>] [-Attributes <ConfigDiffInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverConfigDiff -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcVserverConfigDiff -Query <ConfigDiffInfo> [-Attributes <ConfigDiffInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
