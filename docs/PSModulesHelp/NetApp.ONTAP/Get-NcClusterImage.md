Get-NcClusterImage
------------------

### Synopsis
Get information about image on each node of the cluster

---

### Description

Get information about image on each node of the cluster

---

### Related Links
* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

* [Get-NcClusterImageUpdateHistory](Get-NcClusterImageUpdateHistory)

---

### Examples
> Example 1

Get-NcClusterImage
Get image information from all nodes.

CurrentVersion                                DateInstalled NcController                  NodeId
--------------                                ------------- ------------                  ------
8.3RC1                                           1402131694 10.225.215.73                 f3250-215-73-75-01
8.3RC1                                           1402130930 10.225.215.73                 f3250-215-73-75-02

> Example 2

Get-NcClusterImage -Node f3250-215-73-75-01
Get image information from single node.

CurrentVersion                                DateInstalled NcController                  NodeId
--------------                                ------------- ------------                  ------
8.3RC1                                           1402131694 10.225.215.73                 f3250-215-73-75-01

---

### Parameters
#### **Name**
Name of one or more nodes to get image information from.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                            |
|------------|--------|--------|---------------------|-----------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName<br/>NodeId<br/>Id<br/>Node|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterImageInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcClusterImage -Template" to get the initially empty ClusterImageInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ClusterImageInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty ClusterImageInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterImageInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterImage -Template" to get the initially empty ClusterImageInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[ClusterImageInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterImageInfo

---

### Notes
Category: cluster image
API: cluster-image-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImage [[-Name] <String[]>] [-Attributes <ClusterImageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImage -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterImage -Query <ClusterImageInfo> [-Attributes <ClusterImageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
